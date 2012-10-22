<CsoundSynthesizer>
<CsOptions>
-odac -m128
</CsOptions>
<CsInstruments>

;set send and receive ports
giSendPort =          7000 ;from Csound to Inscore
giRecvPort =          7001 ;from Inscore to Csound
giErrPort  =          7002 ;error messages from Inscore

;initialize
giGetOut   OSCinit    giRecvPort
giGetErr   OSCinit    giErrPort

  instr ReceiveInscoreOutput
;delete previous contents in /ITL/scene on localhost
Sdelmsg    sprintf    "/ITL/scene/%s","*"
           OSCsend    1,"", giSendPort, Sdelmsg, "s", "del"
;send text
           OSCsend    1,"", giSendPort, "/ITL/scene/text", "sss", "set", "txt", "Drag file 'GetPorts.inscore'\nhere and watch\nCsound's output console!"
;scale (enlarge)
           OSCsend    1,"", giSendPort, "/ITL/scene/text", "sf", "scale", 4
Sreceive   =          ""
kInPort, kOutPort, kErrPort init 0
kGotIt     OSClisten  giGetOut, "/ITL", "siii", Sreceive, kInPort, kOutPort, kErrPort
           printf     "Message from INScore:\nIP Address =  %s\nInput Port =  %d\nOutput Port =  %d\nError Port =  %d\n", kGotIt, Sreceive, kInPort, kOutPort, kErrPort

           schedkwhennamed kGotIt, 0, 1, "ReceiveInscoreErrors", 0, p3
  endin

  instr ReceiveInscoreErrors
;delete previous contents in /ITL/scene on localhost
Sdelmsg    sprintf    "/ITL/scene/%s","*"
           OSCsend    1,"", giSendPort, Sdelmsg, "s", "del"
;send new text
           OSCsend    1,"", giSendPort, "/ITL/scene/text", "sss", "set", "txt", "Now drag file\n'GetError.inscore'\nhere and watch\nCsound's output console!"
;scale (enlarge)
           OSCsend    1,"", giSendPort, "/ITL/scene/text", "sf", "scale", 4
Serror     =          "error"
Sreceive   =          ""
kGotIt     OSClisten  giGetErr, "/ITL", "ss", Serror, Sreceive
           printf     "Error message from INScore:\n%s\n%s", kGotIt, Serror, Sreceive
  endin
</CsInstruments>
<CsScore>
i "ReceiveInscoreOutput" 0 100
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
