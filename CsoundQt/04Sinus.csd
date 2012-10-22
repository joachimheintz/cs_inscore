<CsoundSynthesizer>
<CsOptions>
-odac -m128
</CsOptions>
<CsInstruments>
kr = 20

;set send port
giSendPort =          7000 ;from Csound to Inscore

;a sine wave table
giSine ftgen 0, 0, 1024, 10, 1

  opcode ythsba, S, kkkkkk
  ;returns a string with the type string at first position and following the six parameters
  ;e.g. "sfffff y 0.02 0.001 0.999 0.999 0.999"
ky, kt, kh, ks, kb, ka xin ;1 or 0
Stype strcpyk ""
;y
if ky == 1 then
Stype strcatk Stype, "s"
Sy strcpyk "y"
else 
Stype strcatk Stype, "f"
Sy strcpyk "0.001"
endif
;t
if kt == 1 then
Stype strcatk Stype, "s"
St strcpyk "t"
else 
Stype strcatk Stype, "f"
St strcpyk "0.02"
endif
;h
if kh == 1 then
Stype strcatk Stype, "s"
Sh strcpyk "h"
else 
Stype strcatk Stype, "f"
Sh strcpyk "0.001"
endif
;s
if ks == 1 then
Stype strcatk Stype, "s"
Ss strcpyk "s"
else 
Stype strcatk Stype, "f"
Ss strcpyk "0.999"
endif
;b
if kb == 1 then
Stype strcatk Stype, "s"
Sb strcpyk "b"
else 
Stype strcatk Stype, "f"
Sb strcpyk "0.999"
endif
;a
if ka == 1 then
Stype strcatk Stype, "s"
Sa strcpyk "a"
else 
Stype strcatk Stype, "f"
Sa strcpyk "0.999"
endif
Sout sprintfk "%s %s %s %s %s %s %s", Stype, Sy, St, Sh, Ss, Sb, Sa
xout Sout
  endop

  instr SetInit
;delete previous contents in /ITL/scene on localhost
Sdelmsg    sprintf    "/ITL/scene/%s","*"
           OSCsend    1,"", giSendPort, Sdelmsg, "s", "del"
;load sinus.inscore file
SrootPath  pwd
           OSCsend    1,"", giSendPort, "/ITL", "ss", "rootPath", SrootPath
           OSCsend    1,"", giSendPort, "/ITL", "ss", "load", "sinus.inscore"
           turnoff
  endin

  instr Sinus
kSin poscil .3, .5, giSine
        OSCsend kSin, "", giSendPort, "/ITL/scene/signal/[ythsba]", "f", kSin
  endin

  instr Test
  Stype = "ssfffff"
        ;OSCsend 1, "", giSendPort, "/ITL/scene/signal/sig", Stype, "set", "y", 0.02, 0.001, 0.999, 0.999, 0.999
        kbla init 1
        Stest ythsba 1, 0, 0, 0, 0, 0
        printf "%s\n", 1, Stest
        turnoff
  endin

</CsInstruments>
<CsScore>
;i "SetInit" 0 1
;i "Sinus" 1 100
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{852b0e8c-48e5-4bea-99df-3bd823a22197}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
