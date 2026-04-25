<Qucs Schematic 25.2.0>
<Properties>
  <View=-938,-1162,3045,893,1.0627,772,1193>
  <Grid=10,10,1>
  <DataSet=basedonstackex.dat>
  <DataDisplay=basedonstackex.dpl>
  <OpenDisplay=0>
  <Script=basedonstackex.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 -80 510 0 0 0 0>
  <GND * 1 580 450 0 0 0 0>
  <IProbe Load 1 580 350 16 -26 1 3>
  <.TR TR1 1 -50 30 0 56 0 0 "lin" 1 "0" 0 "60ms" 1 "200" 1 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <IProbe Zener 1 70 490 -26 16 1 2>
  <R RL 1 530 230 -26 15 0 0 "1K" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vac V1 1 -80 340 18 -26 0 1 "8" 1 "20Hz" 0 "0" 0 "0" 0 "5" 0 "0" 0>
  <R R4 1 -10 410 15 -26 0 1 "10K" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <IProbe Drive 1 380 430 16 -26 1 3>
  <R R3 1 280 490 -26 -59 0 2 "10K" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Lib T1 1 -10 230 -26 -30 0 1 "PMOSFETs" 0 "IRLML6402" 0>
  <Lib T2 1 280 330 8 -26 1 0 "PMOSFETs" 0 "IRLML6402" 0>
  <Lib T3 1 380 230 -26 -30 1 1 "PMOSFETs" 0 "IRLML6402" 0>
  <.SW SW1 1 120 30 0 56 0 0 "TR1" 0 "log" 1 "RL" 1 "50" 1 "50000" 1 "10" 0>
  <Lib D1 1 120 390 -31 6 0 3 "Z-Diodes" 0 "1N4733A" 1>
  <R R1 1 120 280 15 -26 0 1 "1K" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Diode D2 1 480 350 -36 -11 0 3 "34.9u" 0 "2.28" 0 "13.3p" 0 "0.333" 0 "0.7" 0 "0.5" 0 "0" 0 "0" 0 "2" 0 "0.21" 0 "7.2n" 0 "0" 0 "0" 0 "1" 0 "1" 0 "30" 0 "2u" 0 "26.85" 0 "3" 0 "1.11" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "0" 0 "26.85" 0 "1" 0 "Schottky" 0 "yes" 0>
</Components>
<Wires>
  <-80 370 -80 490 "" 0 0 0 "">
  <580 230 580 320 "" 0 0 0 "">
  <560 230 580 230 "" 0 0 0 "">
  <580 380 580 420 "" 0 0 0 "">
  <410 230 480 230 "out" 470 180 32 "">
  <120 230 120 250 "" 0 0 0 "">
  <120 310 120 330 "" 0 0 0 "">
  <-80 230 -80 310 "" 0 0 0 "">
  <280 230 280 300 "" 0 0 0 "">
  <280 230 350 230 "" 0 0 0 "">
  <280 380 380 380 "" 0 0 0 "">
  <280 360 280 380 "" 0 0 0 "">
  <120 330 120 360 "" 0 0 0 "">
  <-80 490 -80 510 "" 0 0 0 "">
  <100 490 120 490 "" 0 0 0 "">
  <120 420 120 490 "" 0 0 0 "">
  <-10 440 -10 490 "" 0 0 0 "">
  <-10 260 -10 380 "" 0 0 0 "">
  <-80 490 -10 490 "" 0 0 0 "">
  <-80 230 -40 230 "in" -70 190 13 "">
  <-10 490 40 490 "" 0 0 0 "">
  <380 260 380 380 "gate_main" 390 300 71 "">
  <380 460 380 490 "" 0 0 0 "">
  <310 490 380 490 "" 0 0 0 "">
  <380 380 380 400 "" 0 0 0 "">
  <120 230 280 230 "" 0 0 0 "">
  <120 490 250 490 "" 0 0 0 "">
  <20 230 120 230 "" 0 0 0 "">
  <120 330 250 330 "gate_aux" 190 300 63 "">
  <480 230 480 320 "" 0 0 0 "">
  <480 230 500 230 "" 0 0 0 "">
  <480 420 580 420 "" 0 0 0 "">
  <480 380 480 420 "" 0 0 0 "">
  <580 420 580 450 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Rect 690 320 581 439 3 #c0c0c0 1 00 1 0 0.005 0.06 1 -4.59875 2 14.5977 1 -1 0.2 1 315 0 225 1 0 0 "time" "" "">
	<"ngspice/tran.v(in)" #0000ff 0 3 0 2 0>
	  <Mkr 0.0244221/50 296 -293 3 0 0>
	<"ngspice/tran.v(out)" #ff0000 2 3 0 0 0>
	<"xyce/tran.V(OUT)" #00ff00 2 3 0 1 0>
  </Rect>
  <Rect -430 711 304 830 3 #c0c0c0 1 00 1 0 0.01 0.06 1 -1.30866 1 14.3004 1 -1 0.2 1 315 0 225 1 0 0 "time" "" "">
	<"ngspice/tran.v(gate_aux)" #0000ff 0 3 0 0 0>
	<"ngspice/tran.v(gate_main)" #ff0000 0 3 0 0 0>
  </Rect>
  <Rect 691 706 581 279 3 #c0c0c0 1 00 1 0 0.005 0.06 1 -0.00138748 0.005 0.0166674 1 -1 0.5 1 315 0 225 1 0 0 "time" "" "">
	<"ngspice/tran.i(vzener)" #0000ff 0 3 0 0 0>
	<"ngspice/tran.i(vload)" #ff0000 1 3 0 0 0>
	<"ngspice/tran.i(vdrive)" #ff00ff 1 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text -120 -130 12 #000000 0 "based on: https://electronics.stackexchange.com/questions/121670/zener-mosfet-overvoltage-protection\ntriple P-mosfet circuit\nAdded Schottky diode on the out, required to prevent some ringing on the output.\n5.1V Zener for cut-off is required to reduce the output voltage below 6V.">
</Paintings>
