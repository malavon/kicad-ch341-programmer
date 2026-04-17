#!/bin/sh

set -x
PNG_W=3840
PNG_H=$(bc -e "${PNG_W}*9/16")
PRJ="bios-programmer-ch341a"
LAYERS_ALL="F.Cu,B.Cu,F.Silkscreen,B.Silkscreen,F.Mask,B.Mask,Edge.Cuts,F.Fab,B.Fab"
LAYERS_TOP="F.Cu,F.Silkscreen,F.Mask,Edge.Cuts"
LAYERS_BTM="B.Cu,B.Silkscreen,B.Mask,Edge.Cuts"

DIR_EXPORT=output

render () {
	kicad-cli pcb render -o ${DIR_EXPORT}/png/$1.png -w ${PNG_W} -h ${PNG_H} --side $1 --quality basic \
	--zoom ${4:-1} --rotate "${2:-0,0,0}" --pan "${3:-0,0,0}" "${PRJ}.kicad_pcb" > /dev/null
}

renderIso() {
	kicad-cli pcb render -o ${DIR_EXPORT}/png/iso-$1.png --background opaque -w ${PNG_W} -h ${PNG_H} --side $1 --quality high --perspective \
	--zoom ${4:-1} --rotate "${2:-0,0,0}" --pan "${3:-0,0,0}" "${PRJ}.kicad_pcb" > /dev/null
}

exportGerbers() {
	kicad-cli pcb export drill   -o ${DIR_EXPORT}/gerbers "${PRJ}.kicad_pcb"
	kicad-cli pcb export gerbers -o ${DIR_EXPORT}/gerbers --board-plot-params --check-zones --hdnp --subtract-soldermask --use-drill-file-origin "${PRJ}.kicad_pcb"
	( cd "${DIR_EXPORT}/gerbers" && zip gerbers.zip *)
}

exportPdfs() {
	kicad-cli sch export pdf -o ${DIR_EXPORT}/pdf/schematics.pdf --draw-hop-over "${PRJ}.kicad_sch"
	kicad-cli pcb export pdf -o ${DIR_EXPORT}/pdf/layers.pdf -l ${LAYERS_ALL} --black-and-white --check-zones --exclude-value --hdnp --subtract-soldermask --mode-multipage --scale 2 "${PRJ}.kicad_pcb"
	
	# does something, but no idea if it works; cannot view this pdf with okular
	kicad-cli pcb export 3dpdf -o ${DIR_EXPORT}/pdf/3d.pdf --no-dnp --grid-origin --subst-models --fuse-shapes --fill-all-vias "${PRJ}.kicad_pcb"
}

exportPrintable() {
	local layersF="F.Cu,F.Silkscreen,F.Mask,Edge.Cuts"
	local layersB="B.Cu,B.Silkscreen,B.Mask,Edge.Cuts"
	local args='--black-and-white --check-zones --hdnp --subtract-soldermask --mode-single --scale 2 -t "Gruvbox Light"'

	kicad-cli pcb export pdf -o "${DIR_EXPORT}/temp-front.pdf"   -l "${layersF}" ${args} "${PRJ}.kicad_pcb"
	kicad-cli pcb export pdf -o "${DIR_EXPORT}/temp-back.pdf" -m -l "${layersB}" ${args} "${PRJ}.kicad_pcb"
}


exportModels() {
	kicad-cli pcb export step -f -o "${DIR_EXPORT}/models/mech.step" --no-dnp --grid-origin --subst-models --fuse-shapes "${PRJ}.kicad_pcb"
	kicad-cli pcb export step -f -o "${DIR_EXPORT}/models/copr.step" --no-dnp --grid-origin --subst-models --no-components --cut-vias-in-body --include-tracks --include-pads --include-zones --fuse-shapes "${PRJ}.kicad_pcb"
}

exportSchematics() {
	kicad-cli sch export svg -no "${DIR_EXPORT}/schematics" --draw-hop-over "${PRJ}.kicad_sch"
	mv "${DIR_EXPORT}/schematics/bios-programmer-ch341a.svg" "${DIR_EXPORT}/schematics/schematics.svg"
	kicad-cli sch export pdf -no "${DIR_EXPORT}/schematics/schematics.pdf" 	--draw-hop-over "${PRJ}.kicad_sch"

	CONVERT_CMD=$(which rsvg-convert)
	if [ -x "${CONVERT_CMD}" ]; then
		${CONVERT_CMD} -b white --width=${PNG_W} --height=${PNG_H} --keep-aspect-ratio "${DIR_EXPORT}/schematics/schematics.svg" > "${DIR_EXPORT}/schematics/schematics.png"
	fi
}

exportPcbViews() {
	#  --exclude-drawing-sheet --scale 0 
	local svgArgs='--check-zones --hdnp --subtract-soldermask --mode-single --page-size-mode=1'
	# ecludes drawing sheet by default --scale 0
	local pdfArgs='--check-zones --hdnp --subtract-soldermask --mode-multipage' 
	local base="${DIR_EXPORT}/pcb/pcb"

	kicad-cli pcb export svg -o "${base}-top.svg" -l ${LAYERS_TOP} ${svgArgs} "${PRJ}.kicad_pcb"
	kicad-cli pcb export svg -o "${base}-btm.svg" -l ${LAYERS_BTM} ${svgArgs} "${PRJ}.kicad_pcb"
	kicad-cli pcb export svg -o "${base}-nosheet-top.svg" -l ${LAYERS_TOP} ${svgArgs} --exclude-drawing-sheet --fit-page-to-board "${PRJ}.kicad_pcb"
	kicad-cli pcb export svg -o "${base}-nosheet-btm.svg" -l ${LAYERS_BTM} ${svgArgs} --exclude-drawing-sheet --fit-page-to-board "${PRJ}.kicad_pcb"

	kicad-cli pcb export pdf -o "${base}.pdf" 	  -l ${LAYERS_ALL} ${pdfArgs} --ibt "${PRJ}.kicad_pcb"
	kicad-cli pcb export pdf -o "${base}-nosheet.pdf" -l ${LAYERS_ALL} ${pdfArgs} "${PRJ}.kicad_pcb"
	
	# does something, but no idea if it works; cannot view this pdf with okular
	kicad-cli pcb export 3dpdf -o "${base}3d.pdf" --include-tracks --include-pads --include-zones --include-inner-copper --include-silkscreen --include-soldermask --fuse-shapes "${PRJ}.kicad_pcb"

	# convert to PNG, cannot export to PNG directly
	CONVERT_CMD=$(which rsvg-convert)
	if [ -x "${CONVERT_CMD}" ]; then
		${CONVERT_CMD} --width=${PNG_W} --height=${PNG_H} --keep-aspect-ratio "${base}-nosheet-btm.svg" > "${base}-nosheet-btm.png"
		${CONVERT_CMD} --width=${PNG_W} --height=${PNG_H} --keep-aspect-ratio "${base}-nosheet-top.svg" > "${base}-nosheet-btm-top.png"
	fi
}

exportSchematics
exportPcbViews
exportGerbers
exportModels

# exportPrintable

render top 	'0,0,90' 	'-1.7,-0.50,0'
render bottom 	'0,0,-90' 	'-1.7,0.50,0'
renderIso top 	'-50,0,100'	'-2,.5,0'	0.90
