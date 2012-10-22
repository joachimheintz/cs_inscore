<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
;seems to work just once - why?

;make sure INScore receives OSC messages on this port
giPort  =        7000

  instr Hello
;delete previous contents in /ITL/scene on localhost
Sdelmsg sprintf  "/ITL/scene/%s","*"
        OSCsend  1,"", giPort, Sdelmsg, "s", "del"
;send text
        OSCsend  1,"", giPort, "/ITL/scene/text", "sss", "set", "txt", "Hello Csound!"
;scale (enlarge)
        OSCsend  1,"", giPort, "/ITL/scene/text", "sf", "scale", 5
        turnoff
  endin
</CsInstruments>
<CsScore>
i "Hello" 0 1
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
