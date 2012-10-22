<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

;make sure INScore receives OSC messages on this port
giSendPort  =        7000

  instr Hello
;delete previous contents in /ITL/scene on localhost
Sdelmsg sprintf  "/ITL/scene/%s","*"
        OSCsend  1,"", giSendPort, Sdelmsg, "s", "del"
;load image
SrootPath  pwd
           OSCsend    1,"", giSendPort, "/ITL", "ss", "rootPath", SrootPath
        OSCsend  1,"", giSendPort, "/ITL/scene/img", "sss", "set", "img", "../csconf.jpg"
        
kScale invalue "scale"
kX invalue "x"
kY invalue "y"
kAngle invalue "angle"
kRotateX invalue "rotatex"
kRotateY invalue "rotatey"
kRotateZ invalue "rotatez"
kShearX invalue "shearx"
kShearY invalue "sheary"

kMetro metro 10
  if kMetro == 1 then
        OSCsend  kScale,"", giSendPort, "/ITL/scene/img", "sf", "scale", kScale
        OSCsend  kX,"", giSendPort, "/ITL/scene/img", "sf", "x", kX
        OSCsend  kY,"", giSendPort, "/ITL/scene/img", "sf", "y", kY
        OSCsend  kAngle,"", giSendPort, "/ITL/scene/img", "sf", "angle", kAngle
        OSCsend  kRotateX,"", giSendPort, "/ITL/scene/img", "sf", "rotatex", kRotateX
        OSCsend  kRotateY,"", giSendPort, "/ITL/scene/img", "sf", "rotatey", kRotateY
        OSCsend  kRotateZ,"", giSendPort, "/ITL/scene/img", "sf", "rotatez", kRotateZ
        OSCsend  kShearX,"", giSendPort, "/ITL/scene/img", "sff", "shear", kShearX, kShearY
        OSCsend  kShearY, "", giSendPort, "/ITL/scene/img", "sff", "shear", kShearX, kShearY
  endif
;send text
        ;OSCsend  1,"", giPort, "/ITL/scene/text", "sss", "set", "txt", "Hello Csound!"
;scale (enlarge)
        ;OSCsend  1,"", giPort, "/ITL/scene/text", "sf", "scale", 5
  endin
  
  instr Reset
outvalue "scale", 1
outvalue "x", 0
outvalue "y", 0
outvalue "angle", 0
outvalue "rotatex", 0
outvalue "rotatey", 0
outvalue "rotatez", 0
outvalue "shearx", 0
outvalue "sheary", 0
turnoff
  endin
  
  instr ClearImage
Sdelmsg sprintf  "/ITL/scene/%s","*"
        OSCsend  1,"", giSendPort, Sdelmsg, "s", "del"
        turnoff	
  endin
  
  
</CsInstruments>
<CsScore>
i "Hello" 0 99999
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>196</x>
 <y>100</y>
 <width>458</width>
 <height>389</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>255</r>
  <g>170</g>
  <b>0</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>25</x>
  <y>4</y>
  <width>383</width>
  <height>39</height>
  <uuid>{2b129b39-93ca-48a3-9a33-9dbabe9818ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>05ShowAndTransform</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>25</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>scale</objectName>
  <x>104</x>
  <y>131</y>
  <width>275</width>
  <height>24</height>
  <uuid>{d5a255d7-799d-43b4-bb87-84653ca0b94a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.10000000</minimum>
  <maximum>2.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>23</x>
  <y>130</y>
  <width>80</width>
  <height>25</height>
  <uuid>{f7a775f0-7895-4902-92b3-0ddcaead988e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>scale</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>x</objectName>
  <x>103</x>
  <y>162</y>
  <width>275</width>
  <height>24</height>
  <uuid>{0f487aba-8cf2-4d98-9fc1-f47e91515234}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>22</x>
  <y>161</y>
  <width>80</width>
  <height>25</height>
  <uuid>{3f64ffac-a28e-49f7-a98a-49a7bdd6c937}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>x</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>y</objectName>
  <x>103</x>
  <y>193</y>
  <width>275</width>
  <height>24</height>
  <uuid>{c7a3ca2e-d854-4d61-93b6-4b56369acfb5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>22</x>
  <y>192</y>
  <width>80</width>
  <height>28</height>
  <uuid>{ec0f69b7-e4a5-4c40-9fa8-7dbdf7e987a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>y</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>angle</objectName>
  <x>102</x>
  <y>223</y>
  <width>275</width>
  <height>24</height>
  <uuid>{76d5c3af-c535-4941-a5ee-4e84e36f6f42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-180.00000000</minimum>
  <maximum>180.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>21</x>
  <y>222</y>
  <width>80</width>
  <height>28</height>
  <uuid>{897e7634-bb2f-4c03-8805-778ebe3fdc4d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>angle</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>rotatex</objectName>
  <x>101</x>
  <y>254</y>
  <width>275</width>
  <height>24</height>
  <uuid>{73561d28-070d-41d2-a8cd-c8bb5793a3c5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-180.00000000</minimum>
  <maximum>180.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>253</y>
  <width>80</width>
  <height>25</height>
  <uuid>{9e23ac50-97c6-4efc-9f15-65251d8897f9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>rotate x</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>rotatex</objectName>
  <x>375</x>
  <y>253</y>
  <width>79</width>
  <height>26</height>
  <uuid>{08b412a2-9c1d-48ec-a25d-396167834209}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-180</minimum>
  <maximum>180</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>rotatey</objectName>
  <x>101</x>
  <y>280</y>
  <width>275</width>
  <height>24</height>
  <uuid>{69603777-bf5b-48ec-9091-aedbef348857}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-180.00000000</minimum>
  <maximum>180.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>279</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a1afcbcd-d48f-43e8-90d6-24f82240792e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>rotate y</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>rotatey</objectName>
  <x>375</x>
  <y>279</y>
  <width>79</width>
  <height>26</height>
  <uuid>{0a7ee821-af3c-4106-a9dc-25f3e8fd9f76}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-180</minimum>
  <maximum>180</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>rotatez</objectName>
  <x>101</x>
  <y>306</y>
  <width>275</width>
  <height>24</height>
  <uuid>{b50a3dc3-6ce5-41c7-b83e-4292a28f165e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-180.00000000</minimum>
  <maximum>180.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>305</y>
  <width>80</width>
  <height>25</height>
  <uuid>{3af119a6-5329-4d7b-85f1-eb6fc7a9e3d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>rotate z</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>rotatez</objectName>
  <x>375</x>
  <y>305</y>
  <width>79</width>
  <height>26</height>
  <uuid>{0eea33d9-09a6-4a99-a996-9924beaf27f0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-180</minimum>
  <maximum>180</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>shearx</objectName>
  <x>101</x>
  <y>338</y>
  <width>275</width>
  <height>24</height>
  <uuid>{aa93b0b9-4ad1-4892-abc8-78fa13b75d4e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-2.00000000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>337</y>
  <width>80</width>
  <height>25</height>
  <uuid>{7354360b-2845-4b1c-9314-3cd5e10df89a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>shear x</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>shearx</objectName>
  <x>375</x>
  <y>337</y>
  <width>79</width>
  <height>26</height>
  <uuid>{e0e38087-44cd-4c1a-a425-242cea52ce28}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-180</minimum>
  <maximum>180</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>sheary</objectName>
  <x>101</x>
  <y>364</y>
  <width>275</width>
  <height>24</height>
  <uuid>{6c9d468a-b4d8-46b3-b4c7-bdd0a83f630c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-2.00000000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>20</x>
  <y>363</y>
  <width>80</width>
  <height>25</height>
  <uuid>{62631204-dce0-4d4e-88cc-4e47545f51c8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>shear y</label>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>sheary</objectName>
  <x>375</x>
  <y>363</y>
  <width>79</width>
  <height>26</height>
  <uuid>{7d2248cf-0d08-45a1-979d-e93e947ef0d3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-180</minimum>
  <maximum>180</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>scale</objectName>
  <x>379</x>
  <y>130</y>
  <width>79</width>
  <height>26</height>
  <uuid>{5421dce4-fe4a-40bd-9e3f-c31993df525d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>0</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>x</objectName>
  <x>377</x>
  <y>161</y>
  <width>79</width>
  <height>26</height>
  <uuid>{4f989918-dd11-48b4-8f34-64e4bff20963}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-10</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>y</objectName>
  <x>377</x>
  <y>192</y>
  <width>79</width>
  <height>26</height>
  <uuid>{5fa7ebed-7cd2-4355-92a2-090b5339df6d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-10</minimum>
  <maximum>10</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>angle</objectName>
  <x>376</x>
  <y>222</y>
  <width>79</width>
  <height>26</height>
  <uuid>{8bb9ab6d-ad83-43f5-a2bd-134552aa2e76}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-180</minimum>
  <maximum>180</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>button28</objectName>
  <x>358</x>
  <y>89</y>
  <width>100</width>
  <height>30</height>
  <uuid>{41a4804c-7e5e-493e-b389-5c19a5f638a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Reset all</text>
  <image>/</image>
  <eventLine>i "Reset" 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject version="2" type="BSBButton">
  <objectName>button28</objectName>
  <x>248</x>
  <y>87</y>
  <width>100</width>
  <height>30</height>
  <uuid>{e8c277e7-5bc5-4aae-b07b-17fa6908c8f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Clear image</text>
  <image>/</image>
  <eventLine>i "ClearImage" 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
