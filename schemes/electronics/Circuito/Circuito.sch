<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ARD-NANO30NP">
<description>&lt;Development Boards &amp; Kits - AVR Arduino Nano 3.1 W/ATMEGA328 NO-PIN&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="ARDNANO30NP">
<description>&lt;b&gt;ARD-NANO30NP-4_1&lt;/b&gt;&lt;br&gt;
</description>
<pad name="1" x="0" y="0" drill="1.11" diameter="1.665" shape="square"/>
<pad name="2" x="0" y="-2.54" drill="1.11" diameter="1.665"/>
<pad name="3" x="0" y="-5.08" drill="1.11" diameter="1.665"/>
<pad name="4" x="0" y="-7.62" drill="1.11" diameter="1.665"/>
<pad name="5" x="0" y="-10.16" drill="1.11" diameter="1.665"/>
<pad name="6" x="0" y="-12.7" drill="1.11" diameter="1.665"/>
<pad name="7" x="0" y="-15.24" drill="1.11" diameter="1.665"/>
<pad name="8" x="0" y="-17.78" drill="1.11" diameter="1.665"/>
<pad name="9" x="0" y="-20.32" drill="1.11" diameter="1.665"/>
<pad name="10" x="0" y="-22.86" drill="1.11" diameter="1.665"/>
<pad name="11" x="0" y="-25.4" drill="1.11" diameter="1.665"/>
<pad name="12" x="0" y="-27.94" drill="1.11" diameter="1.665"/>
<pad name="13" x="0" y="-30.48" drill="1.11" diameter="1.665"/>
<pad name="14" x="0" y="-33.02" drill="1.11" diameter="1.665"/>
<pad name="15" x="0" y="-35.56" drill="1.11" diameter="1.665"/>
<pad name="16" x="15.24" y="0" drill="1.11" diameter="1.665"/>
<pad name="17" x="15.24" y="-2.54" drill="1.11" diameter="1.665"/>
<pad name="18" x="15.24" y="-5.08" drill="1.11" diameter="1.665"/>
<pad name="19" x="15.24" y="-7.62" drill="1.11" diameter="1.665"/>
<pad name="20" x="15.24" y="-10.16" drill="1.11" diameter="1.665"/>
<pad name="21" x="15.24" y="-12.7" drill="1.11" diameter="1.665"/>
<pad name="22" x="15.24" y="-15.24" drill="1.11" diameter="1.665"/>
<pad name="23" x="15.24" y="-17.78" drill="1.11" diameter="1.665"/>
<pad name="24" x="15.24" y="-20.32" drill="1.11" diameter="1.665"/>
<pad name="25" x="15.24" y="-22.86" drill="1.11" diameter="1.665"/>
<pad name="26" x="15.24" y="-25.4" drill="1.11" diameter="1.665"/>
<pad name="27" x="15.24" y="-27.94" drill="1.11" diameter="1.665"/>
<pad name="28" x="15.24" y="-30.48" drill="1.11" diameter="1.665"/>
<pad name="29" x="15.24" y="-33.02" drill="1.11" diameter="1.665"/>
<pad name="30" x="15.24" y="-35.56" drill="1.11" diameter="1.665"/>
<pad name="MH1" x="0" y="2.54" drill="1.778" diameter="2.667"/>
<pad name="MH2" x="0" y="-38.1" drill="1.778" diameter="2.667"/>
<pad name="MH3" x="15.24" y="-38.1" drill="1.778" diameter="2.667"/>
<pad name="MH4" x="15.24" y="2.54" drill="1.778" diameter="2.667"/>
<text x="7.62" y="-17.78" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="7.62" y="-17.78" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-1.27" y1="3.81" x2="16.51" y2="3.81" width="0.2" layer="51"/>
<wire x1="16.51" y1="3.81" x2="16.51" y2="-39.37" width="0.2" layer="51"/>
<wire x1="16.51" y1="-39.37" x2="-1.27" y2="-39.37" width="0.2" layer="51"/>
<wire x1="-1.27" y1="-39.37" x2="-1.27" y2="3.81" width="0.2" layer="51"/>
<wire x1="-2.334" y1="4.873" x2="17.573" y2="4.873" width="0.1" layer="51"/>
<wire x1="17.573" y1="4.873" x2="17.573" y2="-40.434" width="0.1" layer="51"/>
<wire x1="17.573" y1="-40.434" x2="-2.334" y2="-40.434" width="0.1" layer="51"/>
<wire x1="-2.334" y1="-40.434" x2="-2.334" y2="4.873" width="0.1" layer="51"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-35.56" width="0.1" layer="21"/>
<wire x1="16.51" y1="-35.56" x2="16.51" y2="0" width="0.1" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ARD-NANO30NP">
<wire x1="5.08" y1="2.54" x2="30.48" y2="2.54" width="0.254" layer="94"/>
<wire x1="30.48" y1="-43.18" x2="30.48" y2="2.54" width="0.254" layer="94"/>
<wire x1="30.48" y1="-43.18" x2="5.08" y2="-43.18" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-43.18" width="0.254" layer="94"/>
<text x="31.75" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="31.75" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="D1/TX" x="0" y="-2.54" length="middle"/>
<pin name="D0/RX" x="0" y="-5.08" length="middle"/>
<pin name="RESET_1" x="0" y="-7.62" length="middle"/>
<pin name="GND_1" x="0" y="-10.16" length="middle"/>
<pin name="D2" x="0" y="-12.7" length="middle"/>
<pin name="D3" x="0" y="-15.24" length="middle"/>
<pin name="D4" x="0" y="-17.78" length="middle"/>
<pin name="D5" x="0" y="-20.32" length="middle"/>
<pin name="D6" x="0" y="-22.86" length="middle"/>
<pin name="D7" x="0" y="-25.4" length="middle"/>
<pin name="D8" x="0" y="-27.94" length="middle"/>
<pin name="D9" x="0" y="-30.48" length="middle"/>
<pin name="D10" x="0" y="-33.02" length="middle"/>
<pin name="D11" x="0" y="-35.56" length="middle"/>
<pin name="D12" x="0" y="-38.1" length="middle"/>
<pin name="VIN" x="35.56" y="-2.54" length="middle" rot="R180"/>
<pin name="GND_2" x="35.56" y="-5.08" length="middle" rot="R180"/>
<pin name="RESET_2" x="35.56" y="-7.62" length="middle" rot="R180"/>
<pin name="+5V" x="35.56" y="-10.16" length="middle" rot="R180"/>
<pin name="A7" x="35.56" y="-12.7" length="middle" rot="R180"/>
<pin name="A6" x="35.56" y="-15.24" length="middle" rot="R180"/>
<pin name="A5" x="35.56" y="-17.78" length="middle" rot="R180"/>
<pin name="A4" x="35.56" y="-20.32" length="middle" rot="R180"/>
<pin name="A3" x="35.56" y="-22.86" length="middle" rot="R180"/>
<pin name="A2" x="35.56" y="-25.4" length="middle" rot="R180"/>
<pin name="A1" x="35.56" y="-27.94" length="middle" rot="R180"/>
<pin name="A0" x="35.56" y="-30.48" length="middle" rot="R180"/>
<pin name="AREF" x="35.56" y="-33.02" length="middle" rot="R180"/>
<pin name="3V3" x="35.56" y="-35.56" length="middle" rot="R180"/>
<pin name="D13" x="35.56" y="-38.1" length="middle" rot="R180"/>
<pin name="MH1" x="0" y="0" length="middle"/>
<pin name="MH2" x="0" y="-40.64" length="middle"/>
<pin name="MH3" x="35.56" y="-40.64" length="middle" rot="R180"/>
<pin name="MH4" x="35.56" y="0" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ARD-NANO30NP" prefix="IC">
<description>&lt;b&gt;Development Boards &amp; Kits - AVR Arduino Nano 3.1 W/ATMEGA328 NO-PIN&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.mouser.com/datasheet/2/595/Arduino_Nano3_0-220057.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="ARD-NANO30NP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ARDNANO30NP">
<connects>
<connect gate="G$1" pin="+5V" pad="19"/>
<connect gate="G$1" pin="3V3" pad="29"/>
<connect gate="G$1" pin="A0" pad="27"/>
<connect gate="G$1" pin="A1" pad="26"/>
<connect gate="G$1" pin="A2" pad="25"/>
<connect gate="G$1" pin="A3" pad="24"/>
<connect gate="G$1" pin="A4" pad="23"/>
<connect gate="G$1" pin="A5" pad="22"/>
<connect gate="G$1" pin="A6" pad="21"/>
<connect gate="G$1" pin="A7" pad="20"/>
<connect gate="G$1" pin="AREF" pad="28"/>
<connect gate="G$1" pin="D0/RX" pad="2"/>
<connect gate="G$1" pin="D1/TX" pad="1"/>
<connect gate="G$1" pin="D10" pad="13"/>
<connect gate="G$1" pin="D11" pad="14"/>
<connect gate="G$1" pin="D12" pad="15"/>
<connect gate="G$1" pin="D13" pad="30"/>
<connect gate="G$1" pin="D2" pad="5"/>
<connect gate="G$1" pin="D3" pad="6"/>
<connect gate="G$1" pin="D4" pad="7"/>
<connect gate="G$1" pin="D5" pad="8"/>
<connect gate="G$1" pin="D6" pad="9"/>
<connect gate="G$1" pin="D7" pad="10"/>
<connect gate="G$1" pin="D8" pad="11"/>
<connect gate="G$1" pin="D9" pad="12"/>
<connect gate="G$1" pin="GND_1" pad="4"/>
<connect gate="G$1" pin="GND_2" pad="17"/>
<connect gate="G$1" pin="MH1" pad="MH1"/>
<connect gate="G$1" pin="MH2" pad="MH2"/>
<connect gate="G$1" pin="MH3" pad="MH3"/>
<connect gate="G$1" pin="MH4" pad="MH4"/>
<connect gate="G$1" pin="RESET_1" pad="3"/>
<connect gate="G$1" pin="RESET_2" pad="18"/>
<connect gate="G$1" pin="VIN" pad="16"/>
</connects>
<technologies>
<technology name="">
<attribute name="ARROW_PART_NUMBER" value="" constant="no"/>
<attribute name="ARROW_PRICE-STOCK" value="" constant="no"/>
<attribute name="DESCRIPTION" value="Development Boards &amp; Kits - AVR Arduino Nano 3.1 W/ATMEGA328 NO-PIN" constant="no"/>
<attribute name="HEIGHT" value="5mm" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Gravitech" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="ARD-NANO30NP" constant="no"/>
<attribute name="MOUSER_PART_NUMBER" value="992-ARD-NANO30NP" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/Gravitech/ARD-NANO30NP?qs=Vxac6xGyzPlh7in3DWNTbQ%3D%3D" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ESP32-DevKitV1">
<description>&lt;WiFi / 802.11 Development Tools ESP32 General Development Kit, ESP-WROOM-32 on the board&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="DIP2600W100P254L5400H500Q38N">
<description>&lt;b&gt;ESP32-DevKitC&lt;/b&gt;&lt;br&gt;
</description>
<pad name="1" x="-13" y="22.86" drill="1.2" diameter="1.6" shape="square"/>
<pad name="2" x="-13" y="20.32" drill="1.2" diameter="1.6"/>
<pad name="3" x="-13" y="17.78" drill="1.2" diameter="1.6"/>
<pad name="4" x="-13" y="15.24" drill="1.2" diameter="1.6"/>
<pad name="5" x="-13" y="12.7" drill="1.2" diameter="1.6"/>
<pad name="6" x="-13" y="10.16" drill="1.2" diameter="1.6"/>
<pad name="7" x="-13" y="7.62" drill="1.2" diameter="1.6"/>
<pad name="8" x="-13" y="5.08" drill="1.2" diameter="1.6"/>
<pad name="9" x="-13" y="2.54" drill="1.2" diameter="1.6"/>
<pad name="10" x="-13" y="0" drill="1.2" diameter="1.6"/>
<pad name="11" x="-13" y="-2.54" drill="1.2" diameter="1.6"/>
<pad name="12" x="-13" y="-5.08" drill="1.2" diameter="1.6"/>
<pad name="13" x="-13" y="-7.62" drill="1.2" diameter="1.6"/>
<pad name="14" x="-13" y="-10.16" drill="1.2" diameter="1.6"/>
<pad name="15" x="-13" y="-12.7" drill="1.2" diameter="1.6"/>
<pad name="16" x="13" y="-12.7" drill="1.2" diameter="1.6"/>
<pad name="17" x="13" y="-10.16" drill="1.2" diameter="1.6"/>
<pad name="18" x="13" y="-7.62" drill="1.2" diameter="1.6"/>
<pad name="19" x="13" y="-5.08" drill="1.2" diameter="1.6"/>
<pad name="20" x="13" y="-2.54" drill="1.2" diameter="1.6"/>
<pad name="21" x="13" y="0" drill="1.2" diameter="1.6"/>
<pad name="22" x="13" y="2.54" drill="1.2" diameter="1.6"/>
<pad name="23" x="13" y="5.08" drill="1.2" diameter="1.6"/>
<pad name="24" x="13" y="7.62" drill="1.2" diameter="1.6"/>
<pad name="25" x="13" y="10.16" drill="1.2" diameter="1.6"/>
<pad name="26" x="13" y="12.7" drill="1.2" diameter="1.6"/>
<pad name="27" x="13" y="15.24" drill="1.2" diameter="1.6"/>
<pad name="28" x="13" y="17.78" drill="1.2" diameter="1.6"/>
<pad name="29" x="13" y="20.32" drill="1.2" diameter="1.6"/>
<pad name="30" x="13" y="22.86" drill="1.2" diameter="1.6"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-14.05" y1="27.25" x2="14.05" y2="27.25" width="0.05" layer="51"/>
<wire x1="14.05" y1="27.25" x2="14.05" y2="-27.25" width="0.05" layer="51"/>
<wire x1="14.05" y1="-27.25" x2="-14.05" y2="-27.25" width="0.05" layer="51"/>
<wire x1="-14.05" y1="-27.25" x2="-14.05" y2="27.25" width="0.05" layer="51"/>
<wire x1="-14" y1="27" x2="14" y2="27" width="0.1" layer="51"/>
<wire x1="14" y1="27" x2="14" y2="-27" width="0.1" layer="51"/>
<wire x1="14" y1="-27" x2="-14" y2="-27" width="0.1" layer="51"/>
<wire x1="-14" y1="-27" x2="-14" y2="27" width="0.1" layer="51"/>
<wire x1="-14" y1="25.73" x2="-12.73" y2="27" width="0.1" layer="51"/>
<wire x1="-13.8" y1="27" x2="14" y2="27" width="0.2" layer="21"/>
<wire x1="-14" y1="-27" x2="14" y2="-27" width="0.2" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="ESP32-DEVKITC">
<wire x1="5.08" y1="2.54" x2="25.4" y2="2.54" width="0.254" layer="94"/>
<wire x1="25.4" y1="-48.26" x2="25.4" y2="2.54" width="0.254" layer="94"/>
<wire x1="25.4" y1="-48.26" x2="5.08" y2="-48.26" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-48.26" width="0.254" layer="94"/>
<text x="26.67" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="26.67" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="EN_" x="0" y="0" length="middle" direction="pwr"/>
<pin name="VP" x="0" y="-2.54" length="middle"/>
<pin name="VN" x="0" y="-5.08" length="middle"/>
<pin name="D34" x="0" y="-7.62" length="middle"/>
<pin name="D35" x="0" y="-10.16" length="middle"/>
<pin name="D32" x="0" y="-12.7" length="middle"/>
<pin name="D33" x="0" y="-15.24" length="middle"/>
<pin name="D25" x="0" y="-17.78" length="middle"/>
<pin name="D26" x="0" y="-20.32" length="middle"/>
<pin name="D27" x="0" y="-22.86" length="middle"/>
<pin name="D14" x="0" y="-25.4" length="middle"/>
<pin name="D12" x="0" y="-27.94" length="middle"/>
<pin name="D13" x="0" y="-30.48" length="middle" direction="pwr"/>
<pin name="GND" x="0" y="-33.02" length="middle" direction="pwr"/>
<pin name="VIN" x="0" y="-35.56" length="middle"/>
<pin name="SPI_MOSI" x="30.48" y="0" length="middle" direction="pwr" rot="R180"/>
<pin name="I2C_SCL" x="30.48" y="-2.54" length="middle" rot="R180"/>
<pin name="TXD0" x="30.48" y="-5.08" length="middle" rot="R180"/>
<pin name="RXD0" x="30.48" y="-7.62" length="middle" rot="R180"/>
<pin name="I2C_SDA" x="30.48" y="-10.16" length="middle" rot="R180"/>
<pin name="SPI_MISO" x="30.48" y="-12.7" length="middle" rot="R180"/>
<pin name="SPI_SCK" x="30.48" y="-15.24" length="middle" direction="pwr" rot="R180"/>
<pin name="SPI_SS" x="30.48" y="-17.78" length="middle" rot="R180"/>
<pin name="D17" x="30.48" y="-20.32" length="middle" rot="R180"/>
<pin name="D16" x="30.48" y="-22.86" length="middle" rot="R180"/>
<pin name="D4" x="30.48" y="-25.4" length="middle" rot="R180"/>
<pin name="D2" x="30.48" y="-27.94" length="middle" rot="R180"/>
<pin name="D15" x="30.48" y="-30.48" length="middle" rot="R180"/>
<pin name="GND_" x="30.48" y="-33.02" length="middle" direction="pwr" rot="R180"/>
<pin name="3V3" x="30.48" y="-35.56" length="middle" rot="R180"/>
<rectangle x1="12.7" y1="-48.26" x2="17.78" y2="-43.18" layer="94"/>
<rectangle x1="7.62" y1="-45.72" x2="10.16" y2="-43.18" layer="94"/>
<rectangle x1="20.32" y1="-45.72" x2="22.86" y2="-43.18" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ESP32-DEV-KIT-V1" prefix="U">
<description>&lt;b&gt;WiFi / 802.11 Development Tools ESP32 General Development Kit, ESP-WROOM-32 on the board&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://esp-idf.readthedocs.io/en/latest/get-started/get-started-devkitc.html"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="ESP32-DEVKITC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIP2600W100P254L5400H500Q38N">
<connects>
<connect gate="G$1" pin="3V3" pad="16"/>
<connect gate="G$1" pin="D12" pad="12"/>
<connect gate="G$1" pin="D13" pad="13"/>
<connect gate="G$1" pin="D14" pad="11"/>
<connect gate="G$1" pin="D15" pad="18"/>
<connect gate="G$1" pin="D16" pad="21"/>
<connect gate="G$1" pin="D17" pad="22"/>
<connect gate="G$1" pin="D2" pad="19"/>
<connect gate="G$1" pin="D25" pad="8"/>
<connect gate="G$1" pin="D26" pad="9"/>
<connect gate="G$1" pin="D27" pad="10"/>
<connect gate="G$1" pin="D32" pad="6"/>
<connect gate="G$1" pin="D33" pad="7"/>
<connect gate="G$1" pin="D34" pad="4"/>
<connect gate="G$1" pin="D35" pad="5"/>
<connect gate="G$1" pin="D4" pad="20"/>
<connect gate="G$1" pin="EN_" pad="1"/>
<connect gate="G$1" pin="GND" pad="14"/>
<connect gate="G$1" pin="GND_" pad="17"/>
<connect gate="G$1" pin="I2C_SCL" pad="29"/>
<connect gate="G$1" pin="I2C_SDA" pad="26"/>
<connect gate="G$1" pin="RXD0" pad="27"/>
<connect gate="G$1" pin="SPI_MISO" pad="25"/>
<connect gate="G$1" pin="SPI_MOSI" pad="30"/>
<connect gate="G$1" pin="SPI_SCK" pad="24"/>
<connect gate="G$1" pin="SPI_SS" pad="23"/>
<connect gate="G$1" pin="TXD0" pad="28"/>
<connect gate="G$1" pin="VIN" pad="15"/>
<connect gate="G$1" pin="VN" pad="3"/>
<connect gate="G$1" pin="VP" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="ARROW_PART_NUMBER" value="" constant="no"/>
<attribute name="ARROW_PRICE-STOCK" value="" constant="no"/>
<attribute name="DESCRIPTION" value="WiFi / 802.11 Development Tools ESP32 General Development Kit, ESP-WROOM-32 on the board" constant="no"/>
<attribute name="HEIGHT" value="5mm" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="Espressif Systems" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="ESP32-DevKitC" constant="no"/>
<attribute name="MOUSER_PART_NUMBER" value="" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="PixyConnector">
<description>&lt;b&gt;Harting Ribbon Cable Connectors&lt;/b&gt;&lt;p&gt;
This library includes the former libraries ribcon.lbr and ribcon4.lbr.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="CON14" urn="urn:adsk.eagle:footprint:7077/1">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;</description>
<wire x1="-8.89" y1="9.525" x2="-2.54" y2="8.5852" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-4.1656" x2="-8.89" y2="-4.1656" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="8.5852" x2="1.27" y2="9.525" width="0.1524" layer="21"/>
<wire x1="1.27" y1="9.525" x2="5.715" y2="7.9502" width="0.1524" layer="21"/>
<wire x1="5.715" y1="7.9502" x2="8.89" y2="9.525" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-3.4798" x2="-8.89" y2="-4.1656" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-3.4798" x2="8.89" y2="-4.1656" width="0.1524" layer="21"/>
<wire x1="8.89" y1="3.5052" x2="8.89" y2="9.525" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="3.5052" x2="-8.89" y2="9.525" width="0.1524" layer="21"/>
<wire x1="-8.0518" y1="-2.3368" x2="-7.1882" y2="-2.3368" width="0.1524" layer="21"/>
<wire x1="-7.1882" y1="-2.3368" x2="-7.62" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-3.175" x2="-8.0518" y2="-2.3368" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-3.175" x2="-7.62" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="8.89" y1="3.5052" x2="-8.89" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-3.4798" x2="8.89" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="11.4046" y1="-3.4798" x2="11.4046" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="11.4046" y1="3.5052" x2="10.541" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="10.541" y1="3.5052" x2="10.541" y2="2.159" width="0.1524" layer="21"/>
<wire x1="10.541" y1="2.159" x2="11.4046" y2="2.159" width="0.1524" layer="21"/>
<wire x1="10.541" y1="0.635" x2="11.4046" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.541" y1="3.5052" x2="8.89" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="11.4046" y1="2.159" x2="11.4046" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="11.4046" y1="0.635" x2="11.4046" y2="2.159" width="0.1524" layer="21"/>
<wire x1="10.541" y1="-2.159" x2="11.4046" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="10.541" y1="-2.159" x2="10.541" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="11.4046" y1="-2.159" x2="11.4046" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.541" y1="-0.635" x2="11.4046" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="11.4046" y1="-0.635" x2="11.4046" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-3.4798" x2="10.541" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="10.541" y1="0.635" x2="10.541" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="3.5052" x2="-11.43" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-3.4798" x2="-10.541" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="3.5052" x2="-10.541" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-10.541" y1="3.5052" x2="-10.541" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-10.541" y1="3.5052" x2="-11.43" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="2.159" x2="-10.541" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-10.541" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.541" y1="0.635" x2="-10.541" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-10.541" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-2.159" x2="-10.541" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-10.541" y1="-2.159" x2="-10.541" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-11.43" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="2.159" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-11.43" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-2.159" x2="-11.43" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="-10.541" y1="-3.4798" x2="-8.89" y2="-3.4798" width="0.1524" layer="21"/>
<wire x1="10.541" y1="-3.4798" x2="11.4046" y2="-3.4798" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="-1.27" drill="0.9144"/>
<pad name="2" x="-7.62" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="-5.08" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="-5.08" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="-2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="-2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="7" x="0" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="8" x="0" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="9" x="2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="10" x="2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="11" x="5.08" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="12" x="5.08" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="13" x="7.62" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="14" x="7.62" y="1.27" drill="0.9144" shape="octagon"/>
<text x="-8.255" y="6.0706" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.033" y="-1.905" size="1.524" layer="21" ratio="10">1</text>
<text x="-8.255" y="4.1402" size="1.27" layer="21" ratio="10">R-Cable 14P</text>
<text x="-8.89" y="-5.715" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-7.874" y1="-2.7686" x2="-7.366" y2="-2.5146" layer="21"/>
<rectangle x1="-8.001" y1="-2.5146" x2="-7.62" y2="-2.3876" layer="21"/>
<rectangle x1="-7.62" y1="-2.5146" x2="-7.239" y2="-2.3876" layer="21"/>
<rectangle x1="-7.747" y1="-2.9718" x2="-7.493" y2="-2.7178" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="CON14" urn="urn:adsk.eagle:package:7117/1" type="box">
<description>CONNECTOR</description>
<packageinstances>
<packageinstance name="CON14"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="07-2">
<wire x1="3.81" y1="-10.16" x2="-3.81" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="10.16" x2="-3.81" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="10.16" x2="3.81" y2="10.16" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-10.16" x2="3.81" y2="10.16" width="0.4064" layer="94"/>
<circle x="1.905" y="-7.62" radius="0.635" width="0.254" layer="94"/>
<circle x="1.905" y="-5.08" radius="0.635" width="0.254" layer="94"/>
<circle x="1.905" y="-2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="1.905" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="1.905" y="2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="1.905" y="5.08" radius="0.635" width="0.254" layer="94"/>
<circle x="1.905" y="7.62" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="-7.62" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="-5.08" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="-2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="0" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="2.54" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="5.08" radius="0.635" width="0.254" layer="94"/>
<circle x="-1.905" y="7.62" radius="0.635" width="0.254" layer="94"/>
<text x="-3.81" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="10.922" size="1.778" layer="95">&gt;NAME</text>
<pin name="SPI_MISO" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5V" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="SPI_SCK" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="SPI_MOSI" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="12C_SCL" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="GND" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="SPI_SS" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="ANAOUT" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="I2C_SDA" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="VIN" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="11" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="12" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="13" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="14" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CON14" prefix="CON" uservalue="yes">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="07-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CON14">
<connects>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="12C_SCL" pad="5"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="5V" pad="2"/>
<connect gate="G$1" pin="ANAOUT" pad="8"/>
<connect gate="G$1" pin="GND" pad="6"/>
<connect gate="G$1" pin="I2C_SDA" pad="9"/>
<connect gate="G$1" pin="SPI_MISO" pad="1"/>
<connect gate="G$1" pin="SPI_MOSI" pad="4"/>
<connect gate="G$1" pin="SPI_SCK" pad="3"/>
<connect gate="G$1" pin="SPI_SS" pad="7"/>
<connect gate="G$1" pin="VIN" pad="10"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:7117/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-amp-quick">
<description>&lt;b&gt;AMP Connectors, Type QUICK&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="03P" urn="urn:adsk.eagle:footprint:5912/1">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<wire x1="-1.651" y1="1.778" x2="-1.524" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.651" x2="-1.27" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.397" x2="-1.016" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.651" x2="-0.889" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-2.159" x2="-1.524" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-2.286" x2="-3.556" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.159" x2="-1.524" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.159" x2="-1.016" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="2.54" x2="-3.556" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="1.778" x2="-3.556" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-1.778" x2="-3.556" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-1.778" x2="-3.175" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.778" x2="-1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.778" x2="-3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.524" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.778" x2="-0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.524" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.524" x2="-1.524" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.524" x2="-0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.524" x2="-3.556" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.524" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-1.524" x2="-3.556" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="2.54" x2="-2.794" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.54" x2="-2.794" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="2.54" x2="-2.286" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="2.667" x2="-2.794" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="2.54" x2="-0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.54" x2="0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.413" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.413" x2="-1.524" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.397" x2="1.524" y2="1.651" width="0.1524" layer="21"/>
<wire x1="1.524" y1="1.651" x2="1.651" y2="1.778" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-2.159" x2="1.016" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-2.159" x2="1.524" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-2.286" x2="1.524" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.651" y1="1.778" x2="3.556" y2="1.778" width="0.1524" layer="21"/>
<wire x1="3.556" y1="1.778" x2="3.556" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-1.778" x2="3.556" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-1.778" x2="3.175" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="3.556" y1="1.778" x2="3.556" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.778" x2="3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.778" x2="0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.524" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.778" x2="1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.524" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.524" x2="1.016" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-1.524" x2="1.524" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-1.524" x2="1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.524" x2="3.556" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.524" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-1.524" x2="3.556" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="2.286" y1="2.54" x2="2.286" y2="2.667" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.54" x2="3.556" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.54" x2="2.794" y2="2.667" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.667" x2="2.286" y2="2.667" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.413" x2="1.524" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.54" x2="2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.413" x2="1.016" y2="2.413" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.413" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.889" y1="1.778" x2="1.016" y2="1.651" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.651" x2="1.27" y2="1.397" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.54" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.667" x2="-0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.54" x2="-0.254" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.413" x2="-1.016" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.54" x2="-2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.651" y1="1.778" x2="-3.556" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="1.778" x2="0.889" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.651" x2="-1.016" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.651" x2="-1.524" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.651" x2="1.016" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.524" y1="1.651" x2="1.524" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.778" x2="-1.905" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.286" x2="1.016" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.778" x2="1.905" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-2.159" x2="1.016" y2="-2.286" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="0.9144" shape="long" rot="R90"/>
<text x="-2.032" y="0.9398" size="0.9906" layer="21" ratio="12" rot="R90">1</text>
<text x="-3.556" y="2.9464" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-3.8354" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.8702" y1="-0.3302" x2="-2.2098" y2="0.3302" layer="51"/>
<rectangle x1="-0.3302" y1="-0.3302" x2="0.3302" y2="0.3302" layer="51"/>
<rectangle x1="2.2098" y1="-0.3302" x2="2.8702" y2="0.3302" layer="51"/>
</package>
<package name="12P" urn="urn:adsk.eagle:footprint:5930/1">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<wire x1="-13.081" y1="1.778" x2="-12.954" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="1.651" x2="-12.7" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.397" x2="-12.446" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="1.651" x2="-12.319" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-2.159" x2="-12.954" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-2.286" x2="-14.986" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="-2.159" x2="-12.954" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="-2.159" x2="-12.446" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="2.54" x2="-14.986" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="1.778" x2="-14.986" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-1.778" x2="-14.986" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-1.778" x2="-14.605" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-1.778" x2="-13.335" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-1.778" x2="-14.605" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-1.27" x2="-13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-1.524" x2="-13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-1.778" x2="-12.065" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-1.524" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-1.524" x2="-12.954" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-1.524" x2="-12.446" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="-1.524" x2="-12.065" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-1.524" x2="-14.986" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-1.524" x2="-14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-1.524" x2="-14.986" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="2.54" x2="-14.224" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-14.224" y1="2.54" x2="-14.224" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-13.716" y1="2.54" x2="-13.716" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-13.716" y1="2.667" x2="-14.224" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-11.684" y1="2.54" x2="-11.684" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="2.54" x2="-11.176" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="2.413" x2="-12.446" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="2.413" x2="-12.954" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="-2.159" x2="-10.414" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="-2.159" x2="-9.906" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-2.286" x2="-9.906" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="1.778" x2="-7.874" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.778" x2="-8.255" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.778" x2="-10.795" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.524" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.778" x2="-9.525" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.524" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.524" x2="-10.414" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-1.524" x2="-9.906" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="-1.524" x2="-9.525" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.524" x2="-7.874" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.524" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.144" y1="2.54" x2="-9.144" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="2.54" x2="-7.874" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="2.54" x2="-8.636" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="2.667" x2="-9.144" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="2.413" x2="-9.906" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="2.54" x2="-9.144" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="2.413" x2="-10.414" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="2.413" x2="-10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="2.54" x2="-10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="2.667" x2="-11.684" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="2.54" x2="-11.684" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="2.413" x2="-12.446" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="2.54" x2="-13.716" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-13.081" y1="1.778" x2="-14.986" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-12.319" y1="1.778" x2="-10.414" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="1.778" x2="-9.906" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="1.651" x2="-12.446" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="1.651" x2="-12.954" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="1.778" x2="-10.414" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="1.778" x2="-9.906" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-1.27" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-1.778" x2="-13.335" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-12.446" y1="-2.286" x2="-10.414" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.778" x2="-9.525" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-2.159" x2="-10.414" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="-2.159" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="-2.286" x2="-7.366" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.159" x2="-5.334" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.159" x2="-4.826" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="1.778" x2="-7.366" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.778" x2="-5.715" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.778" x2="-6.985" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.524" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.778" x2="-4.445" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.524" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.524" x2="-5.334" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="-1.524" x2="-4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.524" x2="-4.445" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.524" x2="-7.366" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.524" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="2.54" x2="-6.604" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="2.54" x2="-6.604" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="2.54" x2="-6.096" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="2.667" x2="-6.604" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="2.54" x2="-4.064" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="2.54" x2="-3.556" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.413" x2="-4.826" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="2.413" x2="-5.334" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.397" x2="12.954" y2="1.651" width="0.1524" layer="21"/>
<wire x1="12.954" y1="1.651" x2="13.081" y2="1.778" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-2.159" x2="12.446" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-2.159" x2="12.954" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-2.286" x2="12.954" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="13.081" y1="1.778" x2="14.986" y2="1.778" width="0.1524" layer="21"/>
<wire x1="14.986" y1="1.778" x2="14.986" y2="2.54" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-1.778" x2="14.986" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-1.778" x2="14.605" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="14.986" y1="1.778" x2="14.986" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-1.778" x2="14.605" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-1.27" x2="14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.778" x2="12.065" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.524" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-1.778" x2="13.335" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-1.524" x2="13.335" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.524" x2="12.446" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="12.446" y1="-1.524" x2="12.954" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-1.524" x2="13.335" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-1.524" x2="14.986" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-1.524" x2="14.605" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-1.524" x2="14.986" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="13.716" y1="2.54" x2="13.716" y2="2.667" width="0.1524" layer="21"/>
<wire x1="14.224" y1="2.54" x2="14.986" y2="2.54" width="0.1524" layer="21"/>
<wire x1="14.224" y1="2.54" x2="14.224" y2="2.667" width="0.1524" layer="21"/>
<wire x1="14.224" y1="2.667" x2="13.716" y2="2.667" width="0.1524" layer="21"/>
<wire x1="12.954" y1="2.413" x2="12.954" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.954" y1="2.54" x2="13.716" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.954" y1="2.413" x2="12.446" y2="2.413" width="0.1524" layer="21"/>
<wire x1="12.446" y1="2.413" x2="12.446" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.319" y1="1.778" x2="12.446" y2="1.651" width="0.1524" layer="21"/>
<wire x1="12.446" y1="1.651" x2="12.7" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="2.667" x2="-4.064" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.54" x2="-4.064" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="2.413" x2="-4.826" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="2.54" x2="-6.096" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="1.778" x2="-5.334" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="1.778" x2="-4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="1.778" x2="-5.334" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="12.446" y1="1.651" x2="12.446" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="12.954" y1="1.651" x2="12.954" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.778" x2="-5.715" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.778" x2="13.335" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="12.446" y1="-2.159" x2="12.446" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="1.778" x2="-7.874" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-5.334" y1="1.778" x2="-4.826" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-2.159" x2="-7.874" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-2.159" x2="-7.366" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-2.159" x2="-7.874" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.778" x2="-8.255" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-1.524" x2="-7.874" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="1.778" x2="-7.874" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="2.413" x2="-7.874" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="2.54" x2="-7.874" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="2.54" x2="-7.366" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-2.159" x2="-2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-2.286" x2="-4.826" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-2.159" x2="-2.794" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-2.159" x2="-2.286" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.778" x2="-3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.524" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.778" x2="-1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.524" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.524" x2="-2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.524" x2="-1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.54" x2="-1.524" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.54" x2="-1.016" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="2.413" x2="-2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.413" x2="-2.794" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.667" x2="-1.524" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="2.54" x2="-1.524" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.413" x2="-2.286" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.54" x2="-3.556" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="1.778" x2="-2.794" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.778" x2="-2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="1.778" x2="-2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.778" x2="-3.175" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="1.778" x2="-2.286" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.159" x2="-0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.286" x2="-2.286" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.159" x2="-0.254" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.159" x2="0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.778" x2="-0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.524" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.778" x2="0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.524" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.524" x2="-0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-1.524" x2="0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-1.524" x2="0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.54" x2="1.016" y2="2.667" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.54" x2="1.524" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.413" x2="0.254" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="2.413" x2="-0.254" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.667" x2="1.016" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.54" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="2.413" x2="0.254" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="2.54" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.778" x2="-0.254" y2="1.778" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.778" x2="0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.778" x2="-0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.778" x2="-0.635" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.778" x2="0.254" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-2.159" x2="2.286" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-2.286" x2="0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-2.159" x2="2.286" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-2.159" x2="2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.778" x2="1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.524" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.778" x2="3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.524" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.524" x2="2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.524" x2="2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-1.524" x2="3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.556" y1="2.54" x2="3.556" y2="2.667" width="0.1524" layer="21"/>
<wire x1="4.064" y1="2.54" x2="4.064" y2="2.667" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.413" x2="2.794" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.286" y1="2.413" x2="2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.064" y1="2.667" x2="3.556" y2="2.667" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.54" x2="3.556" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.286" y1="2.413" x2="2.794" y2="2.413" width="0.1524" layer="21"/>
<wire x1="2.286" y1="2.54" x2="1.524" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.778" x2="2.286" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.794" y1="1.778" x2="2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.778" x2="2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.778" x2="1.905" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.778" x2="2.794" y2="1.778" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.159" x2="4.826" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.286" x2="2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.334" y1="-2.159" x2="4.826" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="5.334" y1="-2.159" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.778" x2="4.445" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.524" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.778" x2="5.715" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.524" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.524" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-1.524" x2="5.334" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="5.334" y1="-1.524" x2="5.715" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="6.096" y1="2.54" x2="6.096" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.604" y1="2.54" x2="6.604" y2="2.667" width="0.1524" layer="21"/>
<wire x1="5.334" y1="2.413" x2="5.334" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.413" x2="4.826" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.604" y1="2.667" x2="6.096" y2="2.667" width="0.1524" layer="21"/>
<wire x1="5.334" y1="2.54" x2="6.096" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.413" x2="5.334" y2="2.413" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.54" x2="4.064" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.794" y1="1.778" x2="4.826" y2="1.778" width="0.1524" layer="21"/>
<wire x1="5.334" y1="1.778" x2="5.334" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.778" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.778" x2="4.445" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.778" x2="5.334" y2="1.778" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-2.159" x2="7.366" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-2.286" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-2.159" x2="7.366" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-2.159" x2="7.874" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.778" x2="6.985" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.524" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.778" x2="8.255" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.524" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.524" x2="7.366" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-1.524" x2="7.874" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-1.524" x2="8.255" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="8.636" y1="2.54" x2="8.636" y2="2.667" width="0.1524" layer="21"/>
<wire x1="9.144" y1="2.54" x2="9.144" y2="2.667" width="0.1524" layer="21"/>
<wire x1="7.874" y1="2.413" x2="7.874" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.366" y1="2.413" x2="7.366" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.144" y1="2.667" x2="8.636" y2="2.667" width="0.1524" layer="21"/>
<wire x1="7.874" y1="2.54" x2="8.636" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.366" y1="2.413" x2="7.874" y2="2.413" width="0.1524" layer="21"/>
<wire x1="7.366" y1="2.54" x2="6.604" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.334" y1="1.778" x2="7.366" y2="1.778" width="0.1524" layer="21"/>
<wire x1="7.874" y1="1.778" x2="7.874" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="7.366" y1="1.778" x2="7.366" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.778" x2="6.985" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="7.366" y1="1.778" x2="7.874" y2="1.778" width="0.1524" layer="21"/>
<wire x1="9.906" y1="-2.159" x2="9.906" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="9.906" y1="-2.286" x2="7.874" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-2.159" x2="9.906" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-2.159" x2="10.414" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.778" x2="9.525" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.524" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.778" x2="10.795" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.524" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.524" x2="9.906" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="9.906" y1="-1.524" x2="10.414" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-1.524" x2="10.795" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="11.176" y1="2.54" x2="11.176" y2="2.667" width="0.1524" layer="21"/>
<wire x1="11.684" y1="2.54" x2="11.684" y2="2.667" width="0.1524" layer="21"/>
<wire x1="10.414" y1="2.413" x2="10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.906" y1="2.413" x2="9.906" y2="2.54" width="0.1524" layer="21"/>
<wire x1="11.684" y1="2.667" x2="11.176" y2="2.667" width="0.1524" layer="21"/>
<wire x1="10.414" y1="2.54" x2="11.176" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.906" y1="2.413" x2="10.414" y2="2.413" width="0.1524" layer="21"/>
<wire x1="9.906" y1="2.54" x2="9.144" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.874" y1="1.778" x2="9.906" y2="1.778" width="0.1524" layer="21"/>
<wire x1="10.414" y1="1.778" x2="10.414" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="9.906" y1="1.778" x2="9.906" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.778" x2="9.525" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="9.906" y1="1.778" x2="10.414" y2="1.778" width="0.1524" layer="21"/>
<wire x1="11.684" y1="2.54" x2="12.446" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.414" y1="1.778" x2="12.319" y2="1.778" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.27" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.446" y1="-2.286" x2="10.414" y2="-2.286" width="0.1524" layer="21"/>
<pad name="1" x="-13.97" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="2" x="-11.43" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="3" x="-8.89" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="4" x="-6.35" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="5" x="-3.81" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="7" x="1.27" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="6" x="-1.27" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="12" x="13.97" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="8" x="3.81" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="9" x="6.35" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="10" x="8.89" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="11" x="11.43" y="0" drill="0.9144" shape="long" rot="R90"/>
<text x="-13.462" y="0.9398" size="0.9906" layer="21" ratio="12" rot="R90">1</text>
<text x="-14.986" y="2.9464" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-14.986" y="-3.8354" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-14.3002" y1="-0.3302" x2="-13.6398" y2="0.3302" layer="51"/>
<rectangle x1="-11.7602" y1="-0.3302" x2="-11.0998" y2="0.3302" layer="51"/>
<rectangle x1="-9.2202" y1="-0.3302" x2="-8.5598" y2="0.3302" layer="51"/>
<rectangle x1="-6.6802" y1="-0.3302" x2="-6.0198" y2="0.3302" layer="51"/>
<rectangle x1="-4.1402" y1="-0.3302" x2="-3.4798" y2="0.3302" layer="51"/>
<rectangle x1="0.9398" y1="-0.3302" x2="1.6002" y2="0.3302" layer="51"/>
<rectangle x1="-1.6002" y1="-0.3302" x2="-0.9398" y2="0.3302" layer="51"/>
<rectangle x1="13.6398" y1="-0.3302" x2="14.3002" y2="0.3302" layer="51"/>
<rectangle x1="3.4798" y1="-0.3302" x2="4.1402" y2="0.3302" layer="51"/>
<rectangle x1="6.0198" y1="-0.3302" x2="6.6802" y2="0.3302" layer="51"/>
<rectangle x1="8.5598" y1="-0.3302" x2="9.2202" y2="0.3302" layer="51"/>
<rectangle x1="11.0998" y1="-0.3302" x2="11.7602" y2="0.3302" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="03P" urn="urn:adsk.eagle:package:5957/1" type="box">
<description>AMP QUICK CONNECTOR</description>
<packageinstances>
<packageinstance name="03P"/>
</packageinstances>
</package3d>
<package3d name="12P" urn="urn:adsk.eagle:package:5965/1" type="box">
<description>AMP QUICK CONNECTOR</description>
<packageinstances>
<packageinstance name="12P"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="M03">
<wire x1="3.81" y1="-5.08" x2="-2.54" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<text x="-2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<pin name="SEÑAL" x="7.62" y="-2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5V" x="7.62" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="GND" x="7.62" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="I2C_LEVELCONVERTER">
<wire x1="1.27" y1="-2.54" x2="-33.02" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="-29.21" y1="5.08" x2="-30.48" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-29.21" y1="2.54" x2="-30.48" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-29.21" y1="0" x2="-30.48" y2="0" width="0.6096" layer="94"/>
<wire x1="-33.02" y1="15.24" x2="-33.02" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-33.02" y1="15.24" x2="1.27" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-29.21" y1="10.16" x2="-30.48" y2="10.16" width="0.6096" layer="94"/>
<wire x1="-29.21" y1="7.62" x2="-30.48" y2="7.62" width="0.6096" layer="94"/>
<wire x1="-29.21" y1="12.7" x2="-30.48" y2="12.7" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="0" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="7.62" x2="0" y2="7.62" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="10.16" x2="0" y2="10.16" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="12.7" x2="0" y2="12.7" width="0.6096" layer="94"/>
<text x="-5.08" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-5.08" y="16.002" size="1.778" layer="95">&gt;NAME</text>
<pin name="H1" x="-35.56" y="0" length="middle" direction="pas" swaplevel="1"/>
<pin name="H2" x="-35.56" y="2.54" length="middle" direction="pas" swaplevel="1"/>
<pin name="HGND" x="-35.56" y="5.08" length="middle" direction="pas" swaplevel="1"/>
<pin name="HV" x="-35.56" y="7.62" length="middle" direction="pas" swaplevel="1"/>
<pin name="H3" x="-35.56" y="10.16" length="middle" direction="pas" swaplevel="1"/>
<pin name="H4" x="-35.56" y="12.7" length="middle" direction="pas" swaplevel="1"/>
<pin name="L1" x="5.08" y="0" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="L2" x="5.08" y="2.54" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="LGND" x="5.08" y="5.08" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="LV" x="5.08" y="7.62" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="L3" x="5.08" y="10.16" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="L4" x="5.08" y="12.7" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="M03" prefix="SL" uservalue="yes">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="M03" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="03P">
<connects>
<connect gate="G$1" pin="5V" pad="2"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="SEÑAL" pad="1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5957/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="12" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON_SERVO" prefix="SL" uservalue="yes">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="SERVO" symbol="M03" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="03P">
<connects>
<connect gate="SERVO" pin="5V" pad="2"/>
<connect gate="SERVO" pin="GND" pad="3"/>
<connect gate="SERVO" pin="SEÑAL" pad="1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5957/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="12" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="I2C_LEVELCONVERTER" prefix="SL" uservalue="yes">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="I2C_LEVELCONVERTER" x="15.24" y="-5.08"/>
</gates>
<devices>
<device name="" package="12P">
<connects>
<connect gate="G$1" pin="H1" pad="1"/>
<connect gate="G$1" pin="H2" pad="2"/>
<connect gate="G$1" pin="H3" pad="3"/>
<connect gate="G$1" pin="H4" pad="4"/>
<connect gate="G$1" pin="HGND" pad="5"/>
<connect gate="G$1" pin="HV" pad="6"/>
<connect gate="G$1" pin="L1" pad="7"/>
<connect gate="G$1" pin="L2" pad="8"/>
<connect gate="G$1" pin="L3" pad="9"/>
<connect gate="G$1" pin="L4" pad="10"/>
<connect gate="G$1" pin="LGND" pad="11"/>
<connect gate="G$1" pin="LV" pad="12"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5965/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2" urn="urn:adsk.eagle:library:372">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26990/1" library_version="2">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VCC" urn="urn:adsk.eagle:symbol:26997/1" library_version="2">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" urn="urn:adsk.eagle:component:27037/1" prefix="SUPPLY" library_version="2">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCC" urn="urn:adsk.eagle:component:27060/1" prefix="SUPPLY" library_version="2">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-amp-quick" urn="urn:adsk.eagle:library:125">
<description>&lt;b&gt;AMP Connectors, Type QUICK&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="04P" urn="urn:adsk.eagle:footprint:5913/1" library_version="2">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<wire x1="-2.921" y1="1.778" x2="-2.794" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="1.651" x2="-2.54" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.397" x2="-2.286" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.651" x2="-2.159" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-2.159" x2="-2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-2.286" x2="-4.826" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-2.159" x2="-2.794" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-2.159" x2="-2.286" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.54" x2="-4.826" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="1.778" x2="-4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.778" x2="-4.826" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.778" x2="-4.445" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.778" x2="-3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.778" x2="-4.445" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.524" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.778" x2="-1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.524" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.524" x2="-2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.524" x2="-1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.524" x2="-4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.524" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.524" x2="-4.826" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.54" x2="-4.064" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="2.54" x2="-4.064" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="2.54" x2="-3.556" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="2.667" x2="-4.064" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.54" x2="-1.524" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.54" x2="-1.016" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="2.413" x2="-2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.413" x2="-2.794" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.159" x2="-0.254" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.159" x2="0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-2.286" x2="0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.778" x2="1.905" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.778" x2="-0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.524" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.778" x2="0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.524" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.524" x2="-0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-1.524" x2="0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-1.524" x2="0.635" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.524" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.54" x2="1.016" y2="2.667" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.54" x2="2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.54" x2="1.524" y2="2.667" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.667" x2="1.016" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.413" x2="0.254" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.54" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.413" x2="-0.254" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="2.413" x2="-0.254" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.54" x2="-0.254" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="2.667" x2="-1.524" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="2.54" x2="-1.524" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.413" x2="-2.286" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.54" x2="-3.556" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.778" x2="-4.826" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.778" x2="-0.254" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.778" x2="0.254" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.651" x2="-2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="1.651" x2="-2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.778" x2="-0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.778" x2="0.254" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.778" x2="-3.175" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-2.286" x2="-0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.778" x2="0.635" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.159" x2="-0.254" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.778" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-1.778" x2="4.826" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-2.159" x2="2.286" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-2.159" x2="2.286" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-2.159" x2="2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.286" x2="2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-1.778" x2="4.445" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.778" x2="4.445" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.524" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.524" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.778" x2="3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.524" x2="2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.524" x2="2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-1.524" x2="3.175" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.524" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.794" y1="1.651" x2="2.794" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.651" x2="2.54" y2="1.397" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.651" x2="2.286" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.778" x2="2.286" y2="1.651" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.397" x2="2.921" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.778" x2="4.826" y2="1.778" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.778" x2="3.175" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-1.778" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.286" y1="2.413" x2="2.286" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.413" x2="2.286" y2="2.413" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.54" x2="3.556" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.794" y1="2.413" x2="2.794" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.556" y1="2.54" x2="3.556" y2="2.667" width="0.1524" layer="21"/>
<wire x1="4.064" y1="2.667" x2="3.556" y2="2.667" width="0.1524" layer="21"/>
<wire x1="4.064" y1="2.54" x2="4.064" y2="2.667" width="0.1524" layer="21"/>
<wire x1="4.064" y1="2.54" x2="4.826" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.54" x2="4.826" y2="1.778" width="0.1524" layer="21"/>
<wire x1="0.254" y1="1.778" x2="2.159" y2="1.778" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="0.9144" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="0.9144" shape="long" rot="R90"/>
<text x="-3.302" y="0.9398" size="0.9906" layer="21" ratio="12" rot="R90">1</text>
<text x="-4.826" y="2.9464" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.826" y="-3.8354" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.1402" y1="-0.3302" x2="-3.4798" y2="0.3302" layer="51"/>
<rectangle x1="-1.6002" y1="-0.3302" x2="-0.9398" y2="0.3302" layer="51"/>
<rectangle x1="0.9398" y1="-0.3302" x2="1.6002" y2="0.3302" layer="51"/>
<rectangle x1="3.4798" y1="-0.3302" x2="4.1402" y2="0.3302" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="04P" urn="urn:adsk.eagle:package:5958/1" type="box" library_version="2">
<description>AMP QUICK CONNECTOR</description>
<packageinstances>
<packageinstance name="04P"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="M04" urn="urn:adsk.eagle:symbol:5918/1" library_version="2">
<wire x1="1.27" y1="-5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="-2.54" x2="0" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="0" y2="5.08" width="0.6096" layer="94"/>
<text x="-5.08" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-5.08" y="8.382" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="5.08" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="5.08" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="5.08" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="M04" urn="urn:adsk.eagle:component:5989/2" prefix="SL" uservalue="yes" library_version="2">
<description>&lt;b&gt;AMP QUICK CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="M04" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="04P">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5958/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="19" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-hirose" urn="urn:adsk.eagle:library:152">
<description>&lt;b&gt;Hirose Connectors&lt;/b&gt;&lt;p&gt;
www.hirose.co.jp&lt;p&gt;
Include : &lt;br&gt;
con-hirose-df12d(3.0)60dp0.5v80.lbr from Bob Starr &amp;lt;rtzaudio@mindspring.com&amp;gt;&lt;br&gt;
con-hirose.lbr from Bob Starr &amp;lt;rtzaudio@mindspring.com&amp;gt;&lt;br&gt;</description>
<packages>
<package name="FH21-8S-1DS" urn="urn:adsk.eagle:footprint:7186/1" library_version="2">
<description>&lt;b&gt;FPC Connector&lt;/b&gt;&lt;p&gt;
1 MM, right angle</description>
<wire x1="-4.5" y1="2" x2="-3.3" y2="2" width="0.2032" layer="21"/>
<wire x1="-3.3" y1="2" x2="4.5" y2="2" width="0.2032" layer="51"/>
<wire x1="-5" y1="-3.3" x2="5" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="2" x2="-4.5" y2="2.5" width="0.2032" layer="21"/>
<wire x1="-4.5" y1="2.5" x2="-5" y2="2.5" width="0.2032" layer="21"/>
<wire x1="-5" y1="2.5" x2="-5" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="4.5" y1="2" x2="4.5" y2="2.5" width="0.2032" layer="21"/>
<wire x1="4.5" y1="2.5" x2="5" y2="2.5" width="0.2032" layer="21"/>
<wire x1="5" y1="2.5" x2="5" y2="-3.3" width="0.2032" layer="21"/>
<pad name="1" x="-3.5" y="0" drill="0.8128"/>
<pad name="2" x="-2.5" y="2" drill="0.8128"/>
<pad name="3" x="-1.5" y="0" drill="0.8128"/>
<pad name="4" x="-0.5" y="2" drill="0.8128"/>
<pad name="5" x="0.5" y="0" drill="0.8128"/>
<pad name="6" x="1.5" y="2" drill="0.8128"/>
<pad name="7" x="2.5" y="0" drill="0.8128"/>
<pad name="8" x="3.5" y="2" drill="0.8128"/>
<text x="-4.472" y="3.094" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-4.526" y="-5.026" size="0.8128" layer="27" ratio="10">&gt;VALUE</text>
<polygon width="0.2032" layer="21">
<vertex x="-3.5" y="-2.5"/>
<vertex x="-4" y="-1.5"/>
<vertex x="-3" y="-1.5"/>
</polygon>
</package>
</packages>
<packages3d>
<package3d name="FH21-8S-1DS" urn="urn:adsk.eagle:package:7267/1" type="box" library_version="2">
<description>FPC Connector
1 MM, right angle</description>
<packageinstances>
<packageinstance name="FH21-8S-1DS"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="CON-1X8" urn="urn:adsk.eagle:symbol:7185/1" library_version="2">
<wire x1="1.905" y1="11.43" x2="-1.905" y2="11.43" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-8.89" x2="-1.905" y2="11.43" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-8.89" x2="1.905" y2="-8.89" width="0.254" layer="94"/>
<wire x1="1.905" y1="11.43" x2="1.905" y2="-8.89" width="0.254" layer="94"/>
<wire x1="-2.54" y1="10.16" x2="-0.635" y2="10.16" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="-0.635" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-0.635" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-0.635" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="10.16" x2="0.635" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="7.62" x2="0.635" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="5.08" x2="0.635" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-0.635" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-0.635" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="-5.08" x2="0.635" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="-7.62" x2="0.635" y2="-7.62" width="0.4064" layer="94"/>
<text x="-1.905" y="12.7" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.905" y="-11.7475" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="10.16" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="-5.08" y="7.62" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="3" x="-5.08" y="5.08" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="4" x="-5.08" y="2.54" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="5" x="-5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="6" x="-5.08" y="-2.54" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="7" x="-5.08" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="8" x="-5.08" y="-7.62" visible="pad" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FH21-8S-1DS" urn="urn:adsk.eagle:component:7332/2" prefix="X" library_version="2">
<description>&lt;b&gt;FPC CONNECTOR&lt;/b&gt;&lt;p&gt;
Source: con-hirose.lbr from Bob Starr &amp;lt;rtzaudio@mindspring.com&amp;gt;</description>
<gates>
<gate name="G$1" symbol="CON-1X8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FH21-8S-1DS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:7267/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="v-reg" urn="urn:adsk.eagle:library:409">
<description>&lt;b&gt;Voltage Regulators&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="78XXS" urn="urn:adsk.eagle:footprint:30278/1" library_version="5">
<description>&lt;b&gt;VOLTAGE REGULATOR&lt;/b&gt;</description>
<wire x1="4.826" y1="-4.318" x2="5.08" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-4.318" x2="-4.826" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-4.064" x2="-4.826" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.143" x2="5.08" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-4.064" x2="-5.08" y2="-1.143" width="0.1524" layer="21"/>
<circle x="-4.6228" y="-3.7084" radius="0.254" width="0" layer="21"/>
<pad name="IN" x="-2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="GND" x="0" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="OUT" x="2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<text x="-5.08" y="-6.0452" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-0.635" y="-3.81" size="1.27" layer="51" ratio="10">-</text>
<text x="-3.175" y="-3.81" size="1.27" layer="51" ratio="10">I</text>
<text x="1.905" y="-3.81" size="1.27" layer="51" ratio="10">O</text>
<rectangle x1="-5.334" y1="-1.27" x2="-3.429" y2="0" layer="21"/>
<rectangle x1="-3.429" y1="-0.762" x2="-1.651" y2="0" layer="21"/>
<rectangle x1="-1.651" y1="-1.27" x2="-0.889" y2="0" layer="21"/>
<rectangle x1="-0.889" y1="-0.762" x2="0.889" y2="0" layer="21"/>
<rectangle x1="0.889" y1="-1.27" x2="1.651" y2="0" layer="21"/>
<rectangle x1="1.651" y1="-0.762" x2="3.429" y2="0" layer="21"/>
<rectangle x1="3.429" y1="-1.27" x2="5.334" y2="0" layer="21"/>
<rectangle x1="-3.429" y1="-1.27" x2="-1.651" y2="-0.762" layer="51"/>
<rectangle x1="-0.889" y1="-1.27" x2="0.889" y2="-0.762" layer="51"/>
<rectangle x1="1.651" y1="-1.27" x2="3.429" y2="-0.762" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="78XXS" urn="urn:adsk.eagle:package:30342/1" type="box" library_version="5">
<description>VOLTAGE REGULATOR</description>
<packageinstances>
<packageinstance name="78XXS"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="78XX" urn="urn:adsk.eagle:symbol:30277/1" library_version="5">
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="2.54" width="0.4064" layer="94"/>
<wire x1="5.08" y1="2.54" x2="-5.08" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<text x="2.54" y="-7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.032" y="-4.318" size="1.524" layer="95">GND</text>
<text x="-4.445" y="-0.635" size="1.524" layer="95">IN</text>
<text x="0.635" y="-0.635" size="1.524" layer="95">OUT</text>
<pin name="IN" x="-7.62" y="0" visible="off" length="short" direction="in"/>
<pin name="GND" x="0" y="-7.62" visible="off" length="short" direction="in" rot="R90"/>
<pin name="OUT" x="7.62" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="78XXS" urn="urn:adsk.eagle:component:30381/2" prefix="IC" uservalue="yes" library_version="5">
<description>&lt;b&gt;VOLTAGE REGULATOR&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="78XX" x="0" y="0"/>
</gates>
<devices>
<device name="" package="78XXS">
<connects>
<connect gate="1" pin="GND" pad="GND"/>
<connect gate="1" pin="IN" pad="IN"/>
<connect gate="1" pin="OUT" pad="OUT"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:30342/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="18" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="docu-dummy" urn="urn:adsk.eagle:library:215">
<description>Dummy symbols</description>
<packages>
</packages>
<symbols>
<symbol name="ELKO" urn="urn:adsk.eagle:symbol:13165/1" library_version="3">
<wire x1="-1.524" y1="-0.889" x2="1.524" y2="-0.889" width="0.254" layer="94"/>
<wire x1="1.524" y1="-0.889" x2="1.524" y2="0" width="0.254" layer="94"/>
<wire x1="-1.524" y1="0" x2="-1.524" y2="-0.889" width="0.254" layer="94"/>
<wire x1="-1.524" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.524" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-5.08" width="0.1524" layer="94"/>
<text x="-0.5842" y="0.4064" size="1.27" layer="94" rot="R90">+</text>
<rectangle x1="-1.651" y1="-2.54" x2="1.651" y2="-1.651" layer="94"/>
</symbol>
<symbol name="RESISTOR" urn="urn:adsk.eagle:symbol:13162/1" library_version="3">
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="0" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ELKO" urn="urn:adsk.eagle:component:13177/1" prefix="C" library_version="3">
<description>&lt;b&gt;ELektrolyt Capacitor&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="ELKO" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" urn="urn:adsk.eagle:component:13171/1" prefix="R" library_version="3">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="led" urn="urn:adsk.eagle:library:259">
<description>&lt;b&gt;LEDs&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;br&gt;
Extended by Federico Battaglin &lt;author&gt;&amp;lt;federico.rd@fdpinternational.com&amp;gt;&lt;/author&gt; with DUOLED</description>
<packages>
<package name="U57X32" urn="urn:adsk.eagle:footprint:15640/1" library_version="5">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
rectangle, 5.7 x 3.2 mm</description>
<wire x1="-3.175" y1="1.905" x2="3.175" y2="1.905" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.905" x2="3.175" y2="1.905" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.905" x2="-3.175" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.905" x2="-3.175" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="1.397" x2="2.667" y2="1.397" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.397" x2="2.667" y2="1.397" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.397" x2="-2.667" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="1.397" x2="-2.667" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="2.54" y2="1.016" width="0.1524" layer="51"/>
<wire x1="2.286" y1="1.27" x2="2.286" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0.508" x2="2.54" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.508" x2="2.54" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.016" x2="2.54" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="1.27" x2="-1.778" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="1.27" x2="-0.762" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.254" y1="1.27" x2="-0.254" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="0.254" y1="1.27" x2="0.254" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="0.762" y1="1.27" x2="0.762" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.778" y1="1.27" x2="1.778" y2="-1.27" width="0.1524" layer="51"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="3.683" y="0.254" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.683" y="-1.524" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="LZR182" urn="urn:adsk.eagle:footprint:15644/1" library_version="5">
<description>&lt;B&gt;LED BLOCK&lt;/B&gt;&lt;p&gt;
2 LEDs, Siemens</description>
<wire x1="1.27" y1="2.54" x2="1.27" y2="2.159" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.159" x2="1.27" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.381" x2="-1.27" y2="2.159" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.381" x2="1.27" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.381" x2="1.27" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="0.381" x2="-1.27" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-2.54" x2="-1.27" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-2.159" x2="-1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="1.27" x2="0" y2="2.159" width="0.1524" layer="51" curve="-90"/>
<wire x1="-0.508" y1="1.27" x2="0" y2="1.778" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="0.762" x2="0.508" y2="1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="0" y1="0.381" x2="0.889" y2="1.27" width="0.1524" layer="51" curve="90"/>
<wire x1="-0.8678" y1="2.0139" x2="0" y2="2.413" width="0.1524" layer="21" curve="-49.396139"/>
<wire x1="0" y1="2.413" x2="0.8678" y2="2.0139" width="0.1524" layer="21" curve="-49.396139"/>
<wire x1="-0.8678" y1="0.5261" x2="0" y2="0.127" width="0.1524" layer="21" curve="49.396139"/>
<wire x1="0" y1="0.127" x2="0.8678" y2="0.5261" width="0.1524" layer="21" curve="49.396139"/>
<wire x1="0.8678" y1="2.0139" x2="1.1431" y2="1.27" width="0.1524" layer="51" curve="-40.602281"/>
<wire x1="0.8678" y1="0.5261" x2="1.1429" y2="1.27" width="0.1524" layer="51" curve="40.60599"/>
<wire x1="-1.143" y1="1.27" x2="-0.8677" y2="2.0139" width="0.1524" layer="51" curve="-40.60599"/>
<wire x1="-1.143" y1="1.27" x2="-0.8678" y2="0.5261" width="0.1524" layer="51" curve="40.604135"/>
<wire x1="-0.889" y1="-1.27" x2="0" y2="-0.381" width="0.1524" layer="51" curve="-90"/>
<wire x1="-0.508" y1="-1.27" x2="0" y2="-0.762" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-1.778" x2="0.508" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="0" y1="-2.159" x2="0.889" y2="-1.27" width="0.1524" layer="51" curve="90"/>
<wire x1="-0.8678" y1="-0.5261" x2="0" y2="-0.127" width="0.1524" layer="21" curve="-49.396139"/>
<wire x1="0" y1="-0.127" x2="0.8678" y2="-0.5261" width="0.1524" layer="21" curve="-49.396139"/>
<wire x1="-0.8678" y1="-2.0139" x2="0" y2="-2.413" width="0.1524" layer="21" curve="49.396139"/>
<wire x1="0" y1="-2.413" x2="0.8678" y2="-2.0139" width="0.1524" layer="21" curve="49.396139"/>
<wire x1="0.8678" y1="-0.5261" x2="1.1429" y2="-1.27" width="0.1524" layer="51" curve="-40.60599"/>
<wire x1="0.8678" y1="-2.0139" x2="1.1431" y2="-1.27" width="0.1524" layer="51" curve="40.602281"/>
<wire x1="-1.143" y1="-1.27" x2="-0.8678" y2="-0.5261" width="0.1524" layer="51" curve="-40.604135"/>
<wire x1="-1.143" y1="-1.27" x2="-0.8677" y2="-2.0139" width="0.1524" layer="51" curve="40.60599"/>
<pad name="A1" x="-1.27" y="1.27" drill="0.8128" shape="octagon"/>
<pad name="K1" x="1.27" y="1.27" drill="0.8128" shape="octagon"/>
<pad name="A2" x="-1.27" y="-1.27" drill="0.8128" shape="octagon"/>
<pad name="K2" x="1.27" y="-1.27" drill="0.8128" shape="octagon"/>
<text x="-1.2954" y="2.7432" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="3.1242" y="-2.794" size="1.016" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-3.175" y="0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-3.302" y="-1.905" size="1.27" layer="21" ratio="10">2</text>
<rectangle x1="1.27" y1="0.381" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.27" y2="1.524" layer="51"/>
<rectangle x1="1.27" y1="-2.159" x2="1.524" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.27" y2="-1.016" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="U57X32" urn="urn:adsk.eagle:package:15789/1" type="box" library_version="5">
<description>LED
rectangle, 5.7 x 3.2 mm</description>
<packageinstances>
<packageinstance name="U57X32"/>
</packageinstances>
</package3d>
<package3d name="LZR182" urn="urn:adsk.eagle:package:15802/1" type="box" library_version="5">
<description>LED BLOCK
2 LEDs, Siemens</description>
<packageinstances>
<packageinstance name="LZR182"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="LED" urn="urn:adsk.eagle:symbol:15639/2" library_version="5">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.921" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="U57X32" urn="urn:adsk.eagle:component:15897/3" prefix="D" library_version="5">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
rectangle, 5.7 x 3.2 mm</description>
<gates>
<gate name="1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="" package="U57X32">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15789/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LZR182" urn="urn:adsk.eagle:component:15905/3" prefix="DZ" library_version="5">
<description>&lt;B&gt;LED BLOCK&lt;/B&gt;&lt;p&gt;
2 LEDs, Siemens</description>
<gates>
<gate name="-1" symbol="LED" x="0" y="0" addlevel="always"/>
<gate name="-2" symbol="LED" x="12.7" y="0" addlevel="always"/>
</gates>
<devices>
<device name="" package="LZR182">
<connects>
<connect gate="-1" pin="A" pad="A1"/>
<connect gate="-1" pin="C" pad="K1"/>
<connect gate="-2" pin="A" pad="A2"/>
<connect gate="-2" pin="C" pad="K2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15802/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="battery" urn="urn:adsk.eagle:library:109">
<description>&lt;b&gt;Lithium Batteries and NC Accus&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="CH291-1220LF" urn="urn:adsk.eagle:footprint:4566/1" library_version="3">
<description>&lt;b&gt;Battery Holder, SMT, 12mm&lt;/b&gt;&lt;p&gt;
multicomp PART NO. CH291-1220LF&lt;br&gt;
Source: &lt;a href="http://www.farnell.com/datasheets/1505860.pdf"&gt; Data sheet &lt;/a&gt;</description>
<smd name="-" x="0" y="14.1458" dx="2.3" dy="4.3" layer="1"/>
<smd name="+" x="0" y="-2.2955" dx="2.3" dy="3.66" layer="1"/>
<hole x="0" y="2" drill="1.3"/>
<hole x="0" y="9.5" drill="1"/>
<wire x1="-6.4239" y1="1.995" x2="-1.5375" y2="13.6375" width="0.2" layer="21" curve="-111.250047"/>
<wire x1="1.5375" y1="13.6375" x2="6.4239" y2="1.995" width="0.2" layer="21" curve="-111.445767"/>
<wire x1="-6.4239" y1="1.995" x2="6.4239" y2="1.995" width="0.2" layer="51" curve="-245.830438"/>
<wire x1="-6.4239" y1="1.995" x2="-6.9825" y2="0.9975" width="0.2" layer="21" curve="-124.211808"/>
<wire x1="-6.9825" y1="0.9975" x2="-7.4214" y2="0.5586" width="0.2" layer="21" curve="92.702019"/>
<wire x1="-7.4214" y1="0.5586" x2="-7.4214" y2="-0.2394" width="0.2" layer="21"/>
<wire x1="-7.4214" y1="-0.2394" x2="-6.8628" y2="-0.7581" width="0.2" layer="21" curve="94.242193"/>
<wire x1="-6.8628" y1="-0.7581" x2="-4.5885" y2="-0.7581" width="0.2" layer="21"/>
<wire x1="-4.5885" y1="-0.7581" x2="-1.5215" y2="-1.4364" width="0.2" layer="21"/>
<wire x1="-1.5215" y1="-1.4364" x2="-1.5215" y2="0.1596" width="0.2" layer="21"/>
<wire x1="6.4239" y1="1.995" x2="6.9825" y2="0.9975" width="0.2" layer="21" curve="124.211808"/>
<wire x1="6.9825" y1="0.9975" x2="7.4214" y2="0.5586" width="0.2" layer="21" curve="-92.702019"/>
<wire x1="7.4214" y1="0.5586" x2="7.4214" y2="-0.2394" width="0.2" layer="21"/>
<wire x1="7.4214" y1="-0.2394" x2="6.8628" y2="-0.7581" width="0.2" layer="21" curve="-94.242193"/>
<wire x1="6.8628" y1="-0.7581" x2="4.5885" y2="-0.7581" width="0.2" layer="21"/>
<wire x1="4.5885" y1="-0.7581" x2="1.5215" y2="-1.4364" width="0.2" layer="21"/>
<wire x1="1.5215" y1="-1.4364" x2="1.5215" y2="0.1596" width="0.2" layer="21"/>
<wire x1="-6.5" y1="0.1596" x2="6.5" y2="0.1596" width="0.2" layer="51"/>
<wire x1="-3.3117" y1="0.6783" x2="-1.8354" y2="12.2892" width="0.2" layer="21" curve="-131.708908"/>
<wire x1="1.7955" y1="12.2892" x2="3.3117" y2="0.6783" width="0.2" layer="21" curve="-132.206586"/>
<wire x1="1.5215" y1="0.1596" x2="6.5" y2="0.1596" width="0.2" layer="21"/>
<wire x1="-6.5" y1="0.1596" x2="-1.5215" y2="0.1596" width="0.2" layer="21"/>
<wire x1="-3.3117" y1="0.6783" x2="-3.5125" y2="0.1625" width="0.2" layer="21" curve="-159.758355"/>
<wire x1="3.3117" y1="0.6783" x2="3.5" y2="0.1625" width="0.2" layer="21" curve="157.437467"/>
<wire x1="-3" y1="11.75" x2="-2.5" y2="11" width="0.2" layer="21"/>
<wire x1="-2.5" y1="11" x2="-3.5" y2="10.25" width="0.2" layer="21"/>
<wire x1="-3.5" y1="10.25" x2="-4.125" y2="10.8875" width="0.2" layer="21"/>
<wire x1="3" y1="11.75" x2="2.5" y2="11" width="0.2" layer="21"/>
<wire x1="2.5" y1="11" x2="3.5" y2="10.25" width="0.2" layer="21"/>
<wire x1="3.5" y1="10.25" x2="4.125" y2="10.8875" width="0.2" layer="21"/>
<wire x1="-1.5" y1="10" x2="-1.5" y2="3" width="0.2" layer="21"/>
<wire x1="-1.5" y1="3" x2="1.5" y2="3" width="0.2" layer="21"/>
<wire x1="1.5" y1="3" x2="1.5" y2="10" width="0.2" layer="21"/>
<wire x1="1.5" y1="10" x2="1" y2="10" width="0.2" layer="21"/>
<wire x1="1" y1="10" x2="1" y2="3.75" width="0.2" layer="21"/>
<wire x1="1" y1="3.75" x2="0.25" y2="3.75" width="0.2" layer="21"/>
<wire x1="0.25" y1="3.75" x2="0.25" y2="5.5" width="0.2" layer="21"/>
<wire x1="0.25" y1="5.5" x2="-0.25" y2="5.5" width="0.2" layer="21"/>
<wire x1="-0.25" y1="5.5" x2="-0.25" y2="3.75" width="0.2" layer="21"/>
<wire x1="-0.25" y1="3.75" x2="-1" y2="3.75" width="0.2" layer="21"/>
<wire x1="-1" y1="3.75" x2="-1" y2="10" width="0.2" layer="21"/>
<wire x1="-1" y1="10" x2="-1.5" y2="10" width="0.2" layer="21"/>
<text x="2" y="14" size="1.27" layer="25" font="vector">&gt;NAME</text>
<text x="1.75" y="-3.5" size="1.27" layer="27" font="vector">&gt;VALUE</text>
<rectangle x1="-0.9" y1="12" x2="0.9" y2="15.825" layer="51"/>
<rectangle x1="-0.9" y1="-3.625" x2="0.9" y2="-0.5" layer="51"/>
</package>
<package name="B2430UNI" urn="urn:adsk.eagle:footprint:4553/1" library_version="3">
<description>&lt;b&gt;LI BATTERY&lt;/b&gt; with different Grids</description>
<wire x1="-0.635" y1="9.144" x2="0.635" y2="9.144" width="0.254" layer="21"/>
<wire x1="0" y1="9.779" x2="0" y2="8.509" width="0.254" layer="21"/>
<wire x1="1.524" y1="-6.985" x2="2.794" y2="-6.985" width="0.254" layer="21"/>
<wire x1="-2.286" y1="14.859" x2="-5.334" y2="14.859" width="0.1524" layer="51"/>
<wire x1="-6.604" y1="14.859" x2="-6.604" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.604" y1="-1.905" x2="6.604" y2="14.859" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-1.905" x2="6.604" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.286" y1="14.859" x2="-2.286" y2="14.859" width="0.1524" layer="21"/>
<wire x1="5.207" y1="14.859" x2="2.286" y2="14.859" width="0.1524" layer="51"/>
<wire x1="-11.557" y1="0" x2="11.557" y2="0" width="0.1524" layer="21" curve="180"/>
<wire x1="6.5644" y1="9.5117" x2="11.5571" y2="0" width="0.1524" layer="21" curve="-55.388597"/>
<wire x1="-11.557" y1="0" x2="-6.6543" y2="9.4491" width="0.1524" layer="21" curve="-54.845911"/>
<wire x1="-6.604" y1="14.859" x2="-5.334" y2="14.859" width="0.1524" layer="21"/>
<wire x1="6.604" y1="14.859" x2="5.207" y2="14.859" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="12.319" x2="-3.556" y2="12.319" width="0.1524" layer="21"/>
<wire x1="6.604" y1="12.319" x2="3.556" y2="12.319" width="0.1524" layer="51"/>
<wire x1="-3.556" y1="12.319" x2="-6.604" y2="12.319" width="0.1524" layer="51"/>
<wire x1="-11.938" y1="0" x2="11.938" y2="0" width="0.1524" layer="21" curve="180"/>
<wire x1="-11.938" y1="0" x2="-6.622" y2="9.933" width="0.1524" layer="21" curve="-56.309882"/>
<wire x1="6.5882" y1="9.9555" x2="11.938" y2="0" width="0.1524" layer="21" curve="-56.504865"/>
<wire x1="3.556" y1="12.319" x2="2.159" y2="12.319" width="0.1524" layer="21"/>
<wire x1="2.159" y1="12.319" x2="-2.159" y2="12.319" width="0.1524" layer="51"/>
<pad name="+@1" x="-3.81" y="14.605" drill="1.1176" diameter="2.54" shape="octagon"/>
<pad name="+" x="3.81" y="14.605" drill="1.1176" diameter="2.54" shape="octagon"/>
<pad name="-" x="0" y="-5.715" drill="1.1176" diameter="2.54" shape="octagon"/>
<pad name="+@3" x="5.08" y="12.065" drill="1.1176" diameter="2.54" shape="octagon"/>
<pad name="+@2" x="-5.08" y="12.065" drill="1.1176" diameter="2.54" shape="octagon"/>
<pad name="-@1" x="0" y="-8.255" drill="1.1176" diameter="2.54" shape="octagon"/>
<pad name="+@4" x="0" y="12.065" drill="1.8034" diameter="3.81" shape="octagon"/>
<text x="-5.08" y="16.256" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="8.89" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-2.921" y="5.08" size="1.27" layer="21" ratio="10">Lit.3V</text>
<text x="-5.08" y="0.635" size="1.27" layer="21" ratio="10">10,2x17,8</text>
<text x="-5.08" y="-3.81" size="1.27" layer="21" ratio="10">10,2x20,3</text>
<text x="-4.064" y="-1.27" size="1.27" layer="21" ratio="10">7,5x20,3</text>
<text x="-1.778" y="2.54" size="1.27" layer="21" ratio="10">0x20,3</text>
</package>
</packages>
<packages3d>
<package3d name="CH291-1220LF" urn="urn:adsk.eagle:package:4617/1" type="box" library_version="3">
<description>Battery Holder, SMT, 12mm
multicomp PART NO. CH291-1220LF
Source:  Data sheet </description>
<packageinstances>
<packageinstance name="CH291-1220LF"/>
</packageinstances>
</package3d>
<package3d name="B2430UNI" urn="urn:adsk.eagle:package:4603/1" type="box" library_version="3">
<description>LI BATTERY with different Grids</description>
<packageinstances>
<packageinstance name="B2430UNI"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="1V2" urn="urn:adsk.eagle:symbol:4515/1" library_version="3">
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.4064" layer="94"/>
<wire x1="0.635" y1="2.54" x2="0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="0.635" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-2.54" width="0.4064" layer="94"/>
<text x="-1.27" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.27" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="-" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
<symbol name="1V2-2+5" urn="urn:adsk.eagle:symbol:4552/1" library_version="3">
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.4064" layer="94"/>
<wire x1="0.635" y1="2.54" x2="0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="0.635" y1="0" x2="5.08" y2="0" width="0.1524" layer="94"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-2.54" width="0.4064" layer="94"/>
<text x="-0.635" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+" x="12.7" y="0" visible="pad" direction="pas" rot="R180"/>
<pin name="-" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
<pin name="+@1" x="10.16" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="+@2" x="7.62" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="+@3" x="5.08" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="+@4" x="2.54" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="-@1" x="-2.54" y="0" visible="off" length="point" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CH291-1220LF" urn="urn:adsk.eagle:component:4678/2" prefix="G" library_version="3">
<description>&lt;b&gt;Battery Holder, SMT, 12mm&lt;/b&gt;&lt;p&gt;
multicomp PART NO. CH291-1220LF&lt;br&gt;
Source: &lt;a href="http://www.farnell.com/datasheets/1505860.pdf"&gt; Data sheet &lt;/a&gt;</description>
<gates>
<gate name="G1" symbol="1V2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CH291-1220LF">
<connects>
<connect gate="G1" pin="+" pad="+"/>
<connect gate="G1" pin="-" pad="-"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:4617/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="B2430UNI" urn="urn:adsk.eagle:component:4657/2" prefix="G" library_version="3">
<description>&lt;b&gt;LI BATTERY&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="1V2-2+5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="B2430UNI">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="+@1" pad="+@1"/>
<connect gate="G$1" pin="+@2" pad="+@2"/>
<connect gate="G$1" pin="+@3" pad="+@3"/>
<connect gate="G$1" pin="+@4" pad="+@4"/>
<connect gate="G$1" pin="-" pad="-"/>
<connect gate="G$1" pin="-@1" pad="-@1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:4603/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="3" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="switch" urn="urn:adsk.eagle:library:380">
<description>&lt;b&gt;Switches&lt;/b&gt;&lt;p&gt;
Marquardt, Siemens, C&amp;K, ITT, and others&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="M251" urn="urn:adsk.eagle:footprint:27546/1" library_version="3">
<description>&lt;b&gt;SLIDING SWITCH&lt;/b&gt;&lt;p&gt;
Mors, distributor Buerklin, 11G702</description>
<wire x1="-1.27" y1="1.524" x2="-0.762" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="1.27" x2="-1.778" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-3.302" y1="1.524" x2="-3.048" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="1.524" x2="-0.254" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-0.254" y1="-1.524" x2="-0.508" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="1.524" x2="-2.286" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="1.524" x2="-2.794" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-3.048" y1="-1.524" x2="-3.302" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="1.524" x2="-0.254" y2="1.524" width="0.1524" layer="51"/>
<wire x1="3.302" y1="-1.27" x2="3.302" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="-1.524" x2="-1.27" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.524" x2="-1.778" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.524" x2="-2.794" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="1.524" x2="-2.794" y2="1.524" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="1.524" x2="-1.778" y2="1.524" width="0.1524" layer="21"/>
<wire x1="0.508" y1="-1.524" x2="-0.254" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="3.302" y1="-1.524" x2="3.048" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-1.524" x2="3.048" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-1.524" x2="0.508" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.524" x2="3.048" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.032" y1="1.524" x2="3.048" y2="1.524" width="0.1524" layer="51"/>
<wire x1="0.508" y1="1.524" x2="-0.254" y2="1.524" width="0.1524" layer="51"/>
<wire x1="0.508" y1="1.524" x2="2.032" y2="1.524" width="0.1524" layer="21"/>
<wire x1="6.35" y1="3.937" x2="6.985" y2="3.302" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.985" y1="-3.302" x2="-6.35" y2="-3.937" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.985" y1="3.302" x2="-6.35" y2="3.937" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.35" y1="-3.937" x2="6.985" y2="-3.302" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.985" y1="-3.302" x2="-6.985" y2="3.302" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-3.937" x2="-6.35" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.302" x2="6.985" y2="3.302" width="0.1524" layer="21"/>
<wire x1="6.35" y1="3.937" x2="-6.35" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-1.27" x2="-0.762" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="1.524" x2="-0.762" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-1.27" x2="-0.762" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.524" x2="-1.27" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.524" x2="3.302" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.27" x2="3.302" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="1.524" x2="-0.508" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-1.524" x2="-0.508" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.27" x2="-3.302" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.27" x2="-3.302" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-3.302" y1="1.524" x2="-3.302" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-1.524" x2="-2.794" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-1.524" x2="-2.032" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="-1.27" x2="-1.778" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-1.524" x2="-2.032" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="1.27" x2="-1.778" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="1.524" x2="-1.27" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.524" x2="-2.286" y2="1.524" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="1.524" x2="-3.048" y2="1.524" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-5.715" y="-0.889" size="1.778" layer="21" ratio="10">1</text>
<text x="4.318" y="-0.889" size="1.778" layer="21" ratio="10">2</text>
<text x="-5.715" y="2.032" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.715" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="M251" urn="urn:adsk.eagle:package:27680/1" type="box" library_version="3">
<description>SLIDING SWITCH
Mors, distributor Buerklin, 11G702</description>
<packageinstances>
<packageinstance name="M251"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="SIS" urn="urn:adsk.eagle:symbol:27543/1" library_version="3">
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="0" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0" x2="-1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="-0.762" y2="0" width="0.1524" layer="94"/>
<wire x1="0.254" y1="0" x2="0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-3.175" x2="2.54" y2="-1.905" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.905" x2="0.635" y2="3.175" width="0.254" layer="94"/>
<wire x1="3.81" y1="2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.905" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="0" x2="-0.254" y2="-0.762" width="0.1524" layer="94"/>
<wire x1="-0.254" y1="-0.762" x2="0.254" y2="0" width="0.1524" layer="94"/>
<text x="-6.35" y="-1.905" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-3.81" y="3.175" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="P" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="S" x="5.08" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="O" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="M251" urn="urn:adsk.eagle:component:27777/2" prefix="S" uservalue="yes" library_version="3">
<description>&lt;b&gt;SLIDING SWITCH&lt;/b&gt;&lt;p&gt;
Mors, distributor Buerklin, 11G702</description>
<gates>
<gate name="1" symbol="SIS" x="0" y="0"/>
</gates>
<devices>
<device name="" package="M251">
<connects>
<connect gate="1" pin="O" pad="1"/>
<connect gate="1" pin="P" pad="2"/>
<connect gate="1" pin="S" pad="3"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:27680/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ngspice-simulation" urn="urn:adsk.eagle:library:527439">
<description>SPICE compatible library parts</description>
<packages>
</packages>
<symbols>
<symbol name="VOLTAGE" urn="urn:adsk.eagle:symbol:527440/5" library_version="18">
<description>Independent Voltage Source, either DC, AC, PULSE, SINE, PWL, EXP, or SFFM</description>
<circle x="0" y="0" radius="5.08" width="0.1524" layer="94"/>
<pin name="+" x="0" y="7.62" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="-" x="0" y="-7.62" visible="off" length="short" direction="pas" rot="R90"/>
<text x="7.62" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="7.62" y="0" size="1.778" layer="96">&gt;VALUE</text>
<text x="7.62" y="-2.54" size="1.778" layer="97">&gt;SPICEMODEL</text>
<text x="7.62" y="-5.08" size="1.778" layer="97">&gt;SPICEEXTRA</text>
<wire x1="-1.27" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="3.81" x2="0" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VOLTAGE" urn="urn:adsk.eagle:component:527469/5" prefix="V" uservalue="yes" library_version="18">
<description>Independent Voltage Source, either DC, AC, PULSE, SINE, PWL, EXP, or SFFM</description>
<gates>
<gate name="G$1" symbol="VOLTAGE" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="VALUE" value="0V" constant="no"/>
<attribute name="_EXTERNAL_" value="" constant="no"/>
</technology>
</technologies>
</device>
</devices>
<spice>
<pinmapping spiceprefix="V">
<pinmap gate="G$1" pin="+" pinorder="1"/>
<pinmap gate="G$1" pin="-" pinorder="2"/>
</pinmapping>
</spice>
</deviceset>
</devicesets>
</library>
<library name="TB6612FNG">
<packages>
<package name="TB6612FNG">
<wire x1="-8.89" y1="7.62" x2="9.144" y2="7.62" width="0.127" layer="21"/>
<wire x1="9.144" y1="7.62" x2="9.144" y2="-12.827" width="0.127" layer="21"/>
<wire x1="-8.89" y1="7.62" x2="-8.89" y2="-12.827" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-12.827" x2="9.144" y2="-12.827" width="0.127" layer="21"/>
<pad name="VM" x="-7.62" y="6.35" drill="0.7" diameter="1.6764" shape="square"/>
<pad name="PWMA" x="7.874" y="6.35" drill="0.6" diameter="1.6764"/>
<pad name="VCC" x="-7.62" y="3.81" drill="0.6" diameter="1.6764"/>
<pad name="GND1" x="-7.62" y="1.27" drill="0.6" diameter="1.6764"/>
<pad name="A1" x="-7.62" y="-1.27" drill="0.6" diameter="1.6764"/>
<pad name="A2" x="-7.62" y="-3.81" drill="0.6" diameter="1.6764"/>
<pad name="B2" x="-7.62" y="-6.35" drill="0.6" diameter="1.6764"/>
<pad name="B1" x="-7.62" y="-8.89" drill="0.6" diameter="1.6764"/>
<pad name="GND2" x="-7.62" y="-11.43" drill="0.6" diameter="1.6764"/>
<pad name="AIN2" x="7.874" y="3.81" drill="0.6" diameter="1.6764"/>
<pad name="AIN1" x="7.874" y="1.27" drill="0.6" diameter="1.6764"/>
<pad name="STBY" x="7.874" y="-1.27" drill="0.6" diameter="1.6764"/>
<pad name="BIN1" x="7.874" y="-3.81" drill="0.6" diameter="1.6764"/>
<pad name="BIN2" x="7.874" y="-6.35" drill="0.6" diameter="1.6764"/>
<pad name="PWMB" x="7.874" y="-8.89" drill="0.6" diameter="1.6764"/>
<pad name="GND3" x="7.874" y="-11.43" drill="0.6" diameter="1.6764"/>
<text x="-7.747" y="8.382" size="1.27" layer="25">&gt;NAME</text>
<text x="-7.62" y="-15.24" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="TB6612FNG">
<pin name="GND1" x="-15.24" y="5.08" length="middle"/>
<pin name="A1" x="-15.24" y="0" length="middle"/>
<pin name="VCC" x="-15.24" y="10.16" length="middle"/>
<pin name="VM" x="-15.24" y="15.24" length="middle"/>
<pin name="A2" x="-15.24" y="-5.08" length="middle"/>
<pin name="B2" x="-15.24" y="-10.16" length="middle"/>
<pin name="B1" x="-15.24" y="-15.24" length="middle"/>
<pin name="GND2" x="-15.24" y="-20.32" length="middle"/>
<pin name="STBY" x="15.24" y="0" length="middle" rot="R180"/>
<pin name="AIN1" x="15.24" y="5.08" length="middle" rot="R180"/>
<pin name="AIN2" x="15.24" y="10.16" length="middle" rot="R180"/>
<pin name="PWMA" x="15.24" y="15.24" length="middle" rot="R180"/>
<pin name="BIN1" x="15.24" y="-5.08" length="middle" rot="R180"/>
<pin name="BIN2" x="15.24" y="-10.16" length="middle" rot="R180"/>
<pin name="PWMB" x="15.24" y="-15.24" length="middle" rot="R180"/>
<pin name="GND3" x="15.24" y="-20.32" length="middle" rot="R180"/>
<wire x1="-10.16" y1="17.78" x2="-10.16" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-22.86" x2="10.16" y2="-22.86" width="0.254" layer="94"/>
<wire x1="10.16" y1="-22.86" x2="10.16" y2="17.78" width="0.254" layer="94"/>
<wire x1="10.16" y1="17.78" x2="-10.16" y2="17.78" width="0.254" layer="94"/>
<text x="-25.4" y="5.08" size="1.778" layer="94">&gt;NAME</text>
<text x="-7.62" y="20.32" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-27.94" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="TB6612FNG" prefix="TB6612">
<gates>
<gate name="G$1" symbol="TB6612FNG" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TB6612FNG">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="AIN1" pad="AIN1"/>
<connect gate="G$1" pin="AIN2" pad="AIN2"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B2" pad="B2"/>
<connect gate="G$1" pin="BIN1" pad="BIN1"/>
<connect gate="G$1" pin="BIN2" pad="BIN2"/>
<connect gate="G$1" pin="GND1" pad="GND1"/>
<connect gate="G$1" pin="GND2" pad="GND2"/>
<connect gate="G$1" pin="GND3" pad="GND3"/>
<connect gate="G$1" pin="PWMA" pad="PWMA"/>
<connect gate="G$1" pin="PWMB" pad="PWMB"/>
<connect gate="G$1" pin="STBY" pad="STBY"/>
<connect gate="G$1" pin="VCC" pad="VCC"/>
<connect gate="G$1" pin="VM" pad="VM"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames" urn="urn:adsk.eagle:library:229">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="FRAME_C_L" urn="urn:adsk.eagle:symbol:13884/1" library_version="1">
<frame x1="0" y1="0" x2="558.8" y2="431.8" columns="11" rows="9" layer="94" border-bottom="no"/>
</symbol>
<symbol name="DOCFIELD" urn="urn:adsk.eagle:symbol:13864/1" library_version="1">
<wire x1="0" y1="0" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="87.63" y2="15.24" width="0.1016" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="71.12" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="0" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="87.63" y1="5.08" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="101.6" y1="5.08" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="0" y1="15.24" x2="0" y2="22.86" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="22.86" x2="101.6" y2="15.24" width="0.1016" layer="94"/>
<text x="1.27" y="1.27" size="2.54" layer="94">Date:</text>
<text x="12.7" y="1.27" size="2.54" layer="94">&gt;LAST_DATE_TIME</text>
<text x="72.39" y="1.27" size="2.54" layer="94">Sheet:</text>
<text x="86.36" y="1.27" size="2.54" layer="94">&gt;SHEET</text>
<text x="88.9" y="11.43" size="2.54" layer="94">REV:</text>
<text x="1.27" y="19.05" size="2.54" layer="94">TITLE:</text>
<text x="1.27" y="11.43" size="2.54" layer="94">Document Number:</text>
<text x="17.78" y="19.05" size="2.54" layer="94">&gt;DRAWING_NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="FRAME_C_L" urn="urn:adsk.eagle:component:13947/1" prefix="FRAME" uservalue="yes" library_version="1">
<description>&lt;b&gt;FRAME&lt;/b&gt; C Size , 17 x 22 INCH, Landscape&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="FRAME_C_L" x="0" y="0" addlevel="always"/>
<gate name="G$2" symbol="DOCFIELD" x="452.12" y="0" addlevel="always"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="ARD-NANO30NP" deviceset="ARD-NANO30NP" device=""/>
<part name="U1" library="ESP32-DevKitV1" deviceset="ESP32-DEV-KIT-V1" device=""/>
<part name="PIXY" library="PixyConnector" deviceset="CON14" device="" package3d_urn="urn:adsk.eagle:package:7117/1"/>
<part name="ENCODER" library="con-amp-quick" deviceset="M03" device="" package3d_urn="urn:adsk.eagle:package:5957/1"/>
<part name="SUPPLY2" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY1" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device="" value="VCC_3,3v"/>
<part name="ULTRA_DERECHO" library="con-amp-quick" library_urn="urn:adsk.eagle:library:125" deviceset="M04" device="" package3d_urn="urn:adsk.eagle:package:5958/1"/>
<part name="SUPPLY3" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device="" value="VCC_5V"/>
<part name="SUPPLY4" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="ULTRA_IZQUIERDO" library="con-amp-quick" library_urn="urn:adsk.eagle:library:125" deviceset="M04" device="" package3d_urn="urn:adsk.eagle:package:5958/1"/>
<part name="SUPPLY5" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device="" value="VCC_5V"/>
<part name="SUPPLY6" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="ULTRA_CENTRO" library="con-amp-quick" library_urn="urn:adsk.eagle:library:125" deviceset="M04" device="" package3d_urn="urn:adsk.eagle:package:5958/1"/>
<part name="SUPPLY7" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device="" value="VCC_5V"/>
<part name="SUPPLY8" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="MPU9250" library="con-hirose" library_urn="urn:adsk.eagle:library:152" deviceset="FH21-8S-1DS" device="" package3d_urn="urn:adsk.eagle:package:7267/1"/>
<part name="SUPPLY9" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device="" value="VCC_5V"/>
<part name="SUPPLY10" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="IC2" library="v-reg" library_urn="urn:adsk.eagle:library:409" deviceset="78XXS" device="" package3d_urn="urn:adsk.eagle:package:30342/1"/>
<part name="SUPPLY11" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="C1" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="ELKO" device=""/>
<part name="C2" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="ELKO" device=""/>
<part name="R3" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="R" device=""/>
<part name="R4" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="R" device=""/>
<part name="D1" library="led" library_urn="urn:adsk.eagle:library:259" deviceset="U57X32" device="" package3d_urn="urn:adsk.eagle:package:15789/1"/>
<part name="D2" library="led" library_urn="urn:adsk.eagle:library:259" deviceset="U57X32" device="" package3d_urn="urn:adsk.eagle:package:15789/1"/>
<part name="G1" library="battery" library_urn="urn:adsk.eagle:library:109" deviceset="CH291-1220LF" device="" package3d_urn="urn:adsk.eagle:package:4617/1"/>
<part name="S1" library="switch" library_urn="urn:adsk.eagle:library:380" deviceset="M251" device="" package3d_urn="urn:adsk.eagle:package:27680/1"/>
<part name="SERVO" library="con-amp-quick" deviceset="CON_SERVO" device="" package3d_urn="urn:adsk.eagle:package:5957/1"/>
<part name="SUPPLY12" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY13" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device=""/>
<part name="SL1" library="con-amp-quick" deviceset="I2C_LEVELCONVERTER" device="" package3d_urn="urn:adsk.eagle:package:5965/1"/>
<part name="SUPPLY15" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY16" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY17" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY18" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY19" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="DZ1" library="led" library_urn="urn:adsk.eagle:library:259" deviceset="LZR182" device="" package3d_urn="urn:adsk.eagle:package:15802/1"/>
<part name="G2" library="battery" library_urn="urn:adsk.eagle:library:109" deviceset="B2430UNI" device="" package3d_urn="urn:adsk.eagle:package:4603/1"/>
<part name="R1" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="R" device=""/>
<part name="R5" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="R" device=""/>
<part name="S2" library="switch" library_urn="urn:adsk.eagle:library:380" deviceset="M251" device="" package3d_urn="urn:adsk.eagle:package:27680/1"/>
<part name="ULTRA_CENTRO1" library="con-amp-quick" library_urn="urn:adsk.eagle:library:125" deviceset="M04" device="" package3d_urn="urn:adsk.eagle:package:5958/1"/>
<part name="SUPPLY22" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device="" value="VCC_5V"/>
<part name="SUPPLY23" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="IC3" library="ARD-NANO30NP" deviceset="ARD-NANO30NP" device=""/>
<part name="SL2" library="con-amp-quick" deviceset="M03" device="" package3d_urn="urn:adsk.eagle:package:5957/1"/>
<part name="SUPPLY26" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="IC4" library="v-reg" library_urn="urn:adsk.eagle:library:409" deviceset="78XXS" device="" package3d_urn="urn:adsk.eagle:package:30342/1"/>
<part name="SUPPLY24" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="C3" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="ELKO" device=""/>
<part name="C4" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="ELKO" device=""/>
<part name="R2" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="R" device=""/>
<part name="R6" library="docu-dummy" library_urn="urn:adsk.eagle:library:215" deviceset="R" device=""/>
<part name="D3" library="led" library_urn="urn:adsk.eagle:library:259" deviceset="U57X32" device="" package3d_urn="urn:adsk.eagle:package:15789/1"/>
<part name="D4" library="led" library_urn="urn:adsk.eagle:library:259" deviceset="U57X32" device="" package3d_urn="urn:adsk.eagle:package:15789/1"/>
<part name="SERVO2" library="con-amp-quick" deviceset="CON_SERVO" device="" package3d_urn="urn:adsk.eagle:package:5957/1"/>
<part name="SUPPLY25" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY28" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="VCC" device=""/>
<part name="SL4" library="con-amp-quick" deviceset="M03" device="" package3d_urn="urn:adsk.eagle:package:5957/1"/>
<part name="SUPPLY29" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SL3" library="con-amp-quick" deviceset="M03" device="" package3d_urn="urn:adsk.eagle:package:5957/1"/>
<part name="SUPPLY27" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="TB1" library="TB6612FNG" deviceset="TB6612FNG" device=""/>
<part name="TB2" library="TB6612FNG" deviceset="TB6612FNG" device=""/>
<part name="MOTOR1" library="ngspice-simulation" library_urn="urn:adsk.eagle:library:527439" deviceset="VOLTAGE" device=""/>
<part name="SUPPLY30" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="SUPPLY31" library="supply2" library_urn="urn:adsk.eagle:library:372" deviceset="GND" device=""/>
<part name="FRAME1" library="frames" library_urn="urn:adsk.eagle:library:229" deviceset="FRAME_C_L" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="134.62" y1="7.62" x2="134.62" y2="-48.26" width="0.1524" layer="98"/>
<wire x1="134.62" y1="-48.26" x2="215.9" y2="-48.26" width="0.1524" layer="98"/>
<wire x1="215.9" y1="-48.26" x2="215.9" y2="7.62" width="0.1524" layer="98"/>
<wire x1="215.9" y1="7.62" x2="134.62" y2="7.62" width="0.1524" layer="98"/>
<wire x1="-50.8" y1="-109.22" x2="-50.8" y2="-165.1" width="0.1524" layer="98"/>
<wire x1="-50.8" y1="-165.1" x2="15.24" y2="-165.1" width="0.1524" layer="98"/>
<wire x1="15.24" y1="-165.1" x2="15.24" y2="-109.22" width="0.1524" layer="98"/>
<wire x1="15.24" y1="-109.22" x2="-50.8" y2="-109.22" width="0.1524" layer="98"/>
<wire x1="25.4" y1="-66.04" x2="25.4" y2="-111.76" width="0.1524" layer="98"/>
<wire x1="25.4" y1="-111.76" x2="106.68" y2="-111.76" width="0.1524" layer="98"/>
<wire x1="106.68" y1="-111.76" x2="106.68" y2="-66.04" width="0.1524" layer="98"/>
<wire x1="106.68" y1="-66.04" x2="25.4" y2="-66.04" width="0.1524" layer="98"/>
<wire x1="-193.04" y1="116.84" x2="-193.04" y2="68.58" width="0.1524" layer="98"/>
<wire x1="-193.04" y1="68.58" x2="-132.08" y2="68.58" width="0.1524" layer="98"/>
<wire x1="-132.08" y1="68.58" x2="-132.08" y2="116.84" width="0.1524" layer="98"/>
<wire x1="-132.08" y1="116.84" x2="-193.04" y2="116.84" width="0.1524" layer="98"/>
<wire x1="-200.66" y1="-2.54" x2="-200.66" y2="-40.64" width="0.1524" layer="98"/>
<wire x1="-200.66" y1="-40.64" x2="-134.62" y2="-40.64" width="0.1524" layer="98"/>
<wire x1="-134.62" y1="-40.64" x2="-134.62" y2="-2.54" width="0.1524" layer="98"/>
<wire x1="-134.62" y1="-2.54" x2="-200.66" y2="-2.54" width="0.1524" layer="98"/>
<wire x1="-35.56" y1="-66.04" x2="-35.56" y2="-91.44" width="0.1524" layer="98"/>
<wire x1="-35.56" y1="-91.44" x2="0" y2="-91.44" width="0.1524" layer="98"/>
<wire x1="0" y1="-91.44" x2="0" y2="-66.04" width="0.1524" layer="98"/>
<wire x1="0" y1="-66.04" x2="-35.56" y2="-66.04" width="0.1524" layer="98"/>
<wire x1="-114.3" y1="-66.04" x2="-114.3" y2="-101.6" width="0.1524" layer="98"/>
<wire x1="-114.3" y1="-101.6" x2="-55.88" y2="-101.6" width="0.1524" layer="98"/>
<wire x1="-55.88" y1="-101.6" x2="-55.88" y2="-66.04" width="0.1524" layer="98"/>
<wire x1="-55.88" y1="-66.04" x2="-114.3" y2="-66.04" width="0.1524" layer="98"/>
<wire x1="142.24" y1="55.88" x2="142.24" y2="17.78" width="0.1524" layer="98"/>
<wire x1="142.24" y1="17.78" x2="208.28" y2="17.78" width="0.1524" layer="98"/>
<wire x1="208.28" y1="17.78" x2="208.28" y2="55.88" width="0.1524" layer="98"/>
<wire x1="208.28" y1="55.88" x2="142.24" y2="55.88" width="0.1524" layer="98"/>
<text x="167.64" y="58.42" size="1.778" layer="92">Camara Pixy 2.0</text>
<text x="160.02" y="10.16" size="1.778" layer="92">Luces encimas de la camara </text>
<text x="-25.4" y="-106.68" size="1.778" layer="92">Gryscopio</text>
<text x="-22.86" y="-63.5" size="1.778" layer="92">Encoder</text>
<text x="55.88" y="-63.5" size="1.778" layer="92">Fuente de Alimentación</text>
<text x="-88.9" y="-63.5" size="1.778" layer="92">Servo</text>
<text x="-170.18" y="58.42" size="1.778" layer="92">Ultrasonido Frontal</text>
<text x="-175.26" y="119.38" size="1.778" layer="92">Ultrasonido Izquierdo</text>
<text x="-180.34" y="0" size="1.778" layer="92">Ultrasonido Derecho</text>
<wire x1="-121.92" y1="43.18" x2="-121.92" y2="-35.56" width="0.1524" layer="98"/>
<wire x1="-121.92" y1="-35.56" x2="-2.54" y2="-35.56" width="0.1524" layer="98"/>
<wire x1="-2.54" y1="-35.56" x2="-2.54" y2="43.18" width="0.1524" layer="98"/>
<wire x1="-2.54" y1="43.18" x2="-121.92" y2="43.18" width="0.1524" layer="98"/>
<wire x1="17.78" y1="48.26" x2="17.78" y2="-43.18" width="0.1524" layer="98"/>
<wire x1="17.78" y1="-43.18" x2="116.84" y2="-43.18" width="0.1524" layer="98"/>
<wire x1="116.84" y1="-43.18" x2="116.84" y2="48.26" width="0.1524" layer="98"/>
<wire x1="116.84" y1="48.26" x2="17.78" y2="48.26" width="0.1524" layer="98"/>
<text x="-68.58" y="45.72" size="1.778" layer="92">Arduino Nano</text>
<text x="63.5" y="50.8" size="1.778" layer="92">ESP32</text>
<wire x1="-132.08" y1="-101.6" x2="-132.08" y2="-50.8" width="0.1524" layer="98"/>
<wire x1="-132.08" y1="-50.8" x2="-187.96" y2="-50.8" width="0.1524" layer="98"/>
<wire x1="-187.96" y1="-50.8" x2="-187.96" y2="-101.6" width="0.1524" layer="98"/>
<wire x1="-187.96" y1="-101.6" x2="-132.08" y2="-101.6" width="0.1524" layer="98"/>
<text x="-170.18" y="-48.26" size="1.778" layer="92">Ultrasonido Tracero</text>
<wire x1="-134.62" y1="7.62" x2="-134.62" y2="55.88" width="0.1524" layer="98"/>
<wire x1="-134.62" y1="55.88" x2="-190.5" y2="55.88" width="0.1524" layer="98"/>
<wire x1="-190.5" y1="55.88" x2="-190.5" y2="7.62" width="0.1524" layer="98"/>
<wire x1="-190.5" y1="7.62" x2="-134.62" y2="7.62" width="0.1524" layer="98"/>
<wire x1="25.4" y1="-127" x2="25.4" y2="-172.72" width="0.1524" layer="98"/>
<wire x1="25.4" y1="-172.72" x2="106.68" y2="-172.72" width="0.1524" layer="98"/>
<wire x1="106.68" y1="-172.72" x2="106.68" y2="-127" width="0.1524" layer="98"/>
<wire x1="106.68" y1="-127" x2="25.4" y2="-127" width="0.1524" layer="98"/>
<text x="45.72" y="-124.46" size="1.778" layer="92">Fuente de Alimentación de los Servos</text>
<wire x1="-114.3" y1="111.76" x2="-114.3" y2="76.2" width="0.1524" layer="98"/>
<wire x1="-114.3" y1="76.2" x2="-55.88" y2="76.2" width="0.1524" layer="98"/>
<wire x1="-55.88" y1="76.2" x2="-55.88" y2="111.76" width="0.1524" layer="98"/>
<wire x1="-55.88" y1="111.76" x2="-114.3" y2="111.76" width="0.1524" layer="98"/>
<text x="-91.44" y="114.3" size="1.778" layer="92">Servo Camara</text>
<wire x1="132.08" y1="-66.04" x2="132.08" y2="-129.54" width="0.1524" layer="90"/>
<wire x1="132.08" y1="-129.54" x2="220.98" y2="-129.54" width="0.1524" layer="90"/>
<wire x1="220.98" y1="-129.54" x2="220.98" y2="-66.04" width="0.1524" layer="90"/>
<wire x1="220.98" y1="-66.04" x2="132.08" y2="-66.04" width="0.1524" layer="90"/>
<text x="170.18" y="-63.5" size="1.778" layer="92" font="fixed">Nano 2</text>
<wire x1="93.98" y1="149.86" x2="93.98" y2="116.84" width="0.1524" layer="90"/>
<wire x1="93.98" y1="116.84" x2="147.32" y2="116.84" width="0.1524" layer="90"/>
<wire x1="147.32" y1="116.84" x2="147.32" y2="149.86" width="0.1524" layer="90"/>
<wire x1="147.32" y1="149.86" x2="93.98" y2="149.86" width="0.1524" layer="90"/>
<text x="109.22" y="152.4" size="1.778" layer="92" font="fixed">Sensor Laser Derecho</text>
<text x="109.22" y="104.14" size="1.778" layer="92" font="fixed">Sensor Laser Izquierdo</text>
<wire x1="93.98" y1="101.6" x2="93.98" y2="76.2" width="0.1524" layer="90"/>
<wire x1="93.98" y1="76.2" x2="147.32" y2="76.2" width="0.1524" layer="90"/>
<wire x1="147.32" y1="76.2" x2="147.32" y2="101.6" width="0.1524" layer="90"/>
<wire x1="147.32" y1="101.6" x2="93.98" y2="101.6" width="0.1524" layer="90"/>
<wire x1="157.48" y1="106.68" x2="157.48" y2="73.66" width="0.1524" layer="90"/>
<wire x1="157.48" y1="73.66" x2="210.82" y2="73.66" width="0.1524" layer="90"/>
<wire x1="210.82" y1="73.66" x2="210.82" y2="106.68" width="0.1524" layer="90"/>
<wire x1="210.82" y1="106.68" x2="157.48" y2="106.68" width="0.1524" layer="90"/>
<text x="172.72" y="109.22" size="1.778" layer="92" font="fixed">Sensor Laser Central</text>
<text x="5.08" y="177.8" size="1.778" layer="92">Drivers del Motor y Motor</text>
<wire x1="83.82" y1="175.26" x2="-48.26" y2="175.26" width="0.1524" layer="90"/>
<wire x1="-48.26" y1="68.58" x2="83.82" y2="68.58" width="0.1524" layer="90"/>
<wire x1="83.82" y1="68.58" x2="83.82" y2="175.26" width="0.1524" layer="90"/>
<wire x1="-48.26" y1="175.26" x2="-48.26" y2="68.58" width="0.1524" layer="90"/>
<text x="213.36" y="-190.5" size="1.778" layer="94">Circuito del Robot del Equipo de Gammaversion</text>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="-71.12" y="25.4" smashed="yes">
<attribute name="NAME" x="-39.37" y="33.02" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="-39.37" y="30.48" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="U1" gate="G$1" x="50.8" y="12.7" smashed="yes">
<attribute name="NAME" x="77.47" y="20.32" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="77.47" y="17.78" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="PIXY" gate="G$1" x="175.26" y="38.1" smashed="yes" rot="R180">
<attribute name="VALUE" x="179.07" y="50.8" size="1.778" layer="96" rot="R180"/>
<attribute name="NAME" x="179.07" y="27.178" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="ENCODER" gate="G$1" x="-25.4" y="-78.74" smashed="yes">
<attribute name="VALUE" x="-27.94" y="-86.36" size="1.778" layer="96"/>
<attribute name="NAME" x="-27.94" y="-72.898" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY2" gate="GND" x="-12.7" y="-81.28" smashed="yes">
<attribute name="VALUE" x="-14.605" y="-84.455" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY1" gate="G$1" x="-12.7" y="-73.66" smashed="yes">
<attribute name="VALUE" x="-14.605" y="-70.485" size="1.778" layer="96"/>
</instance>
<instance part="ULTRA_DERECHO" gate="G$1" x="-182.88" y="-22.86" smashed="yes">
<attribute name="VALUE" x="-187.96" y="-30.48" size="1.778" layer="96"/>
<attribute name="NAME" x="-187.96" y="-14.478" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY3" gate="G$1" x="-172.72" y="-30.48" smashed="yes" rot="R180">
<attribute name="VALUE" x="-170.815" y="-33.655" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY4" gate="GND" x="-172.72" y="-7.62" smashed="yes" rot="R180">
<attribute name="VALUE" x="-170.815" y="-4.445" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="ULTRA_IZQUIERDO" gate="G$1" x="-177.8" y="88.9" smashed="yes">
<attribute name="VALUE" x="-182.88" y="81.28" size="1.778" layer="96"/>
<attribute name="NAME" x="-182.88" y="97.282" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY5" gate="G$1" x="-167.64" y="81.28" smashed="yes" rot="R180">
<attribute name="VALUE" x="-165.735" y="78.105" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY6" gate="GND" x="-167.64" y="104.14" smashed="yes" rot="R180">
<attribute name="VALUE" x="-165.735" y="107.315" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="ULTRA_CENTRO" gate="G$1" x="-175.26" y="30.48" smashed="yes">
<attribute name="VALUE" x="-180.34" y="22.86" size="1.778" layer="96"/>
<attribute name="NAME" x="-180.34" y="38.862" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY7" gate="G$1" x="-160.02" y="15.24" smashed="yes" rot="R180">
<attribute name="VALUE" x="-158.115" y="12.065" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY8" gate="GND" x="-160.02" y="43.18" smashed="yes" rot="R180">
<attribute name="VALUE" x="-158.115" y="46.355" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="MPU9250" gate="G$1" x="-10.16" y="-142.24" smashed="yes">
<attribute name="NAME" x="-12.065" y="-129.54" size="1.778" layer="95"/>
<attribute name="VALUE" x="-12.065" y="-153.9875" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY9" gate="G$1" x="-17.78" y="-124.46" smashed="yes">
<attribute name="VALUE" x="-19.685" y="-121.285" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY10" gate="GND" x="-25.4" y="-124.46" smashed="yes" rot="R180">
<attribute name="VALUE" x="-23.495" y="-121.285" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="IC2" gate="1" x="68.58" y="-83.82" smashed="yes">
<attribute name="NAME" x="71.12" y="-91.44" size="1.778" layer="95"/>
<attribute name="VALUE" x="71.12" y="-93.98" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY11" gate="GND" x="68.58" y="-99.06" smashed="yes">
<attribute name="VALUE" x="66.675" y="-102.235" size="1.778" layer="96"/>
</instance>
<instance part="C1" gate="G$1" x="58.42" y="-91.44" smashed="yes"/>
<instance part="C2" gate="G$1" x="78.74" y="-91.44" smashed="yes"/>
<instance part="R3" gate="G$1" x="53.34" y="-93.98" smashed="yes" rot="R90"/>
<instance part="R4" gate="G$1" x="83.82" y="-93.98" smashed="yes" rot="R90"/>
<instance part="D1" gate="1" x="53.34" y="-86.36" smashed="yes"/>
<instance part="D2" gate="1" x="83.82" y="-86.36" smashed="yes"/>
<instance part="G1" gate="G1" x="38.1" y="-88.9" smashed="yes" rot="R90"/>
<instance part="S1" gate="1" x="43.18" y="-78.74" smashed="yes" rot="R270">
<attribute name="NAME" x="41.275" y="-72.39" size="1.778" layer="95"/>
<attribute name="VALUE" x="46.355" y="-74.93" size="1.778" layer="96"/>
</instance>
<instance part="SERVO" gate="SERVO" x="-104.14" y="-88.9" smashed="yes">
<attribute name="VALUE" x="-106.68" y="-96.52" size="1.778" layer="96"/>
<attribute name="NAME" x="-106.68" y="-83.058" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY12" gate="GND" x="-91.44" y="-78.74" smashed="yes" rot="R180">
<attribute name="VALUE" x="-89.535" y="-75.565" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY13" gate="G$1" x="-86.36" y="-76.2" smashed="yes">
<attribute name="VALUE" x="-88.265" y="-73.025" size="1.778" layer="96"/>
</instance>
<instance part="SL1" gate="G$1" x="81.28" y="27.94" smashed="yes">
<attribute name="VALUE" x="76.2" y="22.86" size="1.778" layer="96"/>
<attribute name="NAME" x="76.2" y="43.942" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY15" gate="GND" x="91.44" y="25.4" smashed="yes">
<attribute name="VALUE" x="89.535" y="22.225" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY16" gate="GND" x="27.94" y="33.02" smashed="yes" rot="R270">
<attribute name="VALUE" x="24.765" y="34.925" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="SUPPLY17" gate="GND" x="187.96" y="35.56" smashed="yes">
<attribute name="VALUE" x="186.055" y="32.385" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY18" gate="GND" x="33.02" y="-25.4" smashed="yes">
<attribute name="VALUE" x="31.115" y="-28.575" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY19" gate="GND" x="-91.44" y="20.32" smashed="yes" rot="R180">
<attribute name="VALUE" x="-89.535" y="23.495" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="DZ1" gate="-1" x="175.26" y="-25.4" smashed="yes">
<attribute name="NAME" x="178.816" y="-29.972" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="180.975" y="-29.972" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="DZ1" gate="-2" x="187.96" y="-25.4" smashed="yes">
<attribute name="NAME" x="191.516" y="-29.972" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="193.675" y="-29.972" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="G2" gate="G$1" x="160.02" y="-25.4" smashed="yes" rot="R90">
<attribute name="NAME" x="156.845" y="-26.035" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="165.1" y="-27.94" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R1" gate="G$1" x="187.96" y="-17.78" smashed="yes" rot="R90"/>
<instance part="R5" gate="G$1" x="175.26" y="-17.78" smashed="yes" rot="R90"/>
<instance part="S2" gate="1" x="167.64" y="-5.08" smashed="yes" rot="R270">
<attribute name="NAME" x="165.735" y="1.27" size="1.778" layer="95"/>
<attribute name="VALUE" x="170.815" y="-1.27" size="1.778" layer="96"/>
</instance>
<instance part="ULTRA_CENTRO1" gate="G$1" x="-175.26" y="-76.2" smashed="yes">
<attribute name="VALUE" x="-180.34" y="-83.82" size="1.778" layer="96"/>
<attribute name="NAME" x="-180.34" y="-67.818" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY22" gate="G$1" x="-160.02" y="-91.44" smashed="yes" rot="R180">
<attribute name="VALUE" x="-158.115" y="-94.615" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY23" gate="GND" x="-160.02" y="-63.5" smashed="yes" rot="R180">
<attribute name="VALUE" x="-158.115" y="-60.325" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="IC3" gate="G$1" x="157.48" y="-78.74" smashed="yes">
<attribute name="NAME" x="189.23" y="-71.12" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="189.23" y="-73.66" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="SL2" gate="G$1" x="109.22" y="134.62" smashed="yes">
<attribute name="VALUE" x="106.68" y="127" size="1.778" layer="96"/>
<attribute name="NAME" x="106.68" y="140.462" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY26" gate="GND" x="121.92" y="142.24" smashed="yes" rot="R180">
<attribute name="VALUE" x="123.825" y="145.415" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="IC4" gate="1" x="68.58" y="-144.78" smashed="yes">
<attribute name="NAME" x="71.12" y="-152.4" size="1.778" layer="95"/>
<attribute name="VALUE" x="71.12" y="-154.94" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY24" gate="GND" x="68.58" y="-160.02" smashed="yes">
<attribute name="VALUE" x="66.675" y="-163.195" size="1.778" layer="96"/>
</instance>
<instance part="C3" gate="G$1" x="58.42" y="-152.4" smashed="yes"/>
<instance part="C4" gate="G$1" x="78.74" y="-152.4" smashed="yes"/>
<instance part="R2" gate="G$1" x="53.34" y="-154.94" smashed="yes" rot="R90"/>
<instance part="R6" gate="G$1" x="83.82" y="-154.94" smashed="yes" rot="R90"/>
<instance part="D3" gate="1" x="53.34" y="-147.32" smashed="yes"/>
<instance part="D4" gate="1" x="83.82" y="-147.32" smashed="yes"/>
<instance part="SERVO2" gate="SERVO" x="-104.14" y="88.9" smashed="yes">
<attribute name="VALUE" x="-106.68" y="81.28" size="1.778" layer="96"/>
<attribute name="NAME" x="-106.68" y="94.742" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY25" gate="GND" x="-91.44" y="99.06" smashed="yes" rot="R180">
<attribute name="VALUE" x="-89.535" y="102.235" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY28" gate="G$1" x="-86.36" y="101.6" smashed="yes">
<attribute name="VALUE" x="-88.265" y="104.775" size="1.778" layer="96"/>
</instance>
<instance part="SL4" gate="G$1" x="109.22" y="88.9" smashed="yes">
<attribute name="VALUE" x="106.68" y="81.28" size="1.778" layer="96"/>
<attribute name="NAME" x="106.68" y="94.742" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY29" gate="GND" x="119.38" y="96.52" smashed="yes" rot="R180">
<attribute name="VALUE" x="121.285" y="99.695" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SL3" gate="G$1" x="172.72" y="91.44" smashed="yes">
<attribute name="VALUE" x="170.18" y="83.82" size="1.778" layer="96"/>
<attribute name="NAME" x="170.18" y="97.282" size="1.778" layer="95"/>
</instance>
<instance part="SUPPLY27" gate="GND" x="185.42" y="99.06" smashed="yes" rot="R180">
<attribute name="VALUE" x="187.325" y="102.235" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="TB1" gate="G$1" x="17.78" y="142.24" smashed="yes">
<attribute name="NAME" x="-7.62" y="147.32" size="1.778" layer="94"/>
<attribute name="NAME" x="10.16" y="162.56" size="1.778" layer="95"/>
<attribute name="VALUE" x="10.16" y="114.3" size="1.778" layer="96"/>
</instance>
<instance part="TB2" gate="G$1" x="17.78" y="101.6" smashed="yes">
<attribute name="NAME" x="-7.62" y="106.68" size="1.778" layer="94"/>
<attribute name="NAME" x="10.16" y="121.92" size="1.778" layer="95"/>
<attribute name="VALUE" x="10.16" y="73.66" size="1.778" layer="96"/>
</instance>
<instance part="MOTOR1" gate="G$1" x="-40.64" y="134.62" smashed="yes">
<attribute name="NAME" x="-33.02" y="137.16" size="1.778" layer="95"/>
<attribute name="VALUE" x="-33.02" y="134.62" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY30" gate="GND" x="60.96" y="124.46" smashed="yes" rot="R180">
<attribute name="VALUE" x="62.865" y="127.635" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="SUPPLY31" gate="GND" x="-25.4" y="109.22" smashed="yes" rot="R180">
<attribute name="VALUE" x="-23.495" y="112.395" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="FRAME1" gate="G$1" x="-254" y="-208.28" smashed="yes"/>
<instance part="FRAME1" gate="G$2" x="198.12" y="-208.28" smashed="yes">
<attribute name="LAST_DATE_TIME" x="210.82" y="-207.01" size="2.54" layer="94"/>
<attribute name="SHEET" x="284.48" y="-207.01" size="2.54" layer="94"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="I2C_SCL" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="I2C_SCL"/>
<wire x1="81.28" y1="10.16" x2="101.6" y2="10.16" width="0.1524" layer="91"/>
<label x="101.6" y="10.16" size="1.778" layer="95" xref="yes"/>
<wire x1="101.6" y1="10.16" x2="101.6" y2="38.1" width="0.1524" layer="91"/>
<pinref part="SL1" gate="G$1" pin="L3"/>
<wire x1="101.6" y1="38.1" x2="86.36" y2="38.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MPU9250" gate="G$1" pin="3"/>
<wire x1="-15.24" y1="-137.16" x2="-33.02" y2="-137.16" width="0.1524" layer="91"/>
<label x="-33.02" y="-137.16" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="I2C_SDA" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="I2C_SDA"/>
<wire x1="81.28" y1="2.54" x2="88.9" y2="2.54" width="0.1524" layer="91"/>
<label x="88.9" y="2.54" size="1.778" layer="95" xref="yes"/>
<label x="88.9" y="2.54" size="1.778" layer="95" xref="yes"/>
<pinref part="SL1" gate="G$1" pin="L2"/>
<wire x1="86.36" y1="30.48" x2="88.9" y2="30.48" width="0.1524" layer="91"/>
<wire x1="88.9" y1="30.48" x2="88.9" y2="2.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MPU9250" gate="G$1" pin="4"/>
<wire x1="-15.24" y1="-139.7" x2="-17.78" y2="-139.7" width="0.1524" layer="91"/>
<label x="-17.78" y="-139.7" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="ENCODER" gate="G$1" pin="5V"/>
<pinref part="SUPPLY2" gate="GND" pin="GND"/>
<wire x1="-12.7" y1="-78.74" x2="-17.78" y2="-78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ULTRA_DERECHO" gate="G$1" pin="4"/>
<wire x1="-177.8" y1="-17.78" x2="-172.72" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="SUPPLY4" gate="GND" pin="GND"/>
<wire x1="-172.72" y1="-17.78" x2="-172.72" y2="-10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ULTRA_IZQUIERDO" gate="G$1" pin="4"/>
<wire x1="-172.72" y1="93.98" x2="-167.64" y2="93.98" width="0.1524" layer="91"/>
<pinref part="SUPPLY6" gate="GND" pin="GND"/>
<wire x1="-167.64" y1="93.98" x2="-167.64" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MPU9250" gate="G$1" pin="2"/>
<wire x1="-15.24" y1="-134.62" x2="-25.4" y2="-134.62" width="0.1524" layer="91"/>
<pinref part="SUPPLY10" gate="GND" pin="GND"/>
<wire x1="-25.4" y1="-134.62" x2="-25.4" y2="-127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC2" gate="1" pin="GND"/>
<pinref part="SUPPLY11" gate="GND" pin="GND"/>
<wire x1="68.58" y1="-91.44" x2="68.58" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-96.52" x2="63.5" y2="-96.52" width="0.1524" layer="91"/>
<junction x="68.58" y="-96.52"/>
<wire x1="63.5" y1="-96.52" x2="66.04" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-96.52" x2="68.58" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-96.52" x2="73.66" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-96.52" x2="68.58" y2="-96.52" width="0.1524" layer="91"/>
<wire x1="53.34" y1="-99.06" x2="63.5" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="63.5" y1="-99.06" x2="63.5" y2="-96.52" width="0.1524" layer="91"/>
<junction x="63.5" y="-96.52"/>
<wire x1="83.82" y1="-99.06" x2="73.66" y2="-99.06" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-99.06" x2="73.66" y2="-96.52" width="0.1524" layer="91"/>
<junction x="73.66" y="-96.52"/>
<pinref part="G1" gate="G1" pin="-"/>
<wire x1="38.1" y1="-93.98" x2="38.1" y2="-104.14" width="0.1524" layer="91"/>
<wire x1="38.1" y1="-104.14" x2="66.04" y2="-104.14" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-104.14" x2="66.04" y2="-96.52" width="0.1524" layer="91"/>
<junction x="66.04" y="-96.52"/>
</segment>
<segment>
<pinref part="ULTRA_CENTRO" gate="G$1" pin="4"/>
<wire x1="-170.18" y1="35.56" x2="-160.02" y2="35.56" width="0.1524" layer="91"/>
<pinref part="SUPPLY8" gate="GND" pin="GND"/>
<wire x1="-160.02" y1="40.64" x2="-160.02" y2="35.56" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SERVO" gate="SERVO" pin="GND"/>
<wire x1="-96.52" y1="-86.36" x2="-91.44" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="-86.36" x2="-91.44" y2="-81.28" width="0.1524" layer="91"/>
<pinref part="SUPPLY12" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SL1" gate="G$1" pin="LGND"/>
<wire x1="86.36" y1="33.02" x2="91.44" y2="33.02" width="0.1524" layer="91"/>
<wire x1="91.44" y1="33.02" x2="91.44" y2="27.94" width="0.1524" layer="91"/>
<pinref part="SUPPLY15" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SL1" gate="G$1" pin="HGND"/>
<wire x1="45.72" y1="33.02" x2="30.48" y2="33.02" width="0.1524" layer="91"/>
<pinref part="SUPPLY16" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="PIXY" gate="G$1" pin="GND"/>
<wire x1="182.88" y1="40.64" x2="187.96" y2="40.64" width="0.1524" layer="91"/>
<wire x1="187.96" y1="40.64" x2="187.96" y2="38.1" width="0.1524" layer="91"/>
<pinref part="SUPPLY17" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="50.8" y1="-20.32" x2="33.02" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="33.02" y1="-20.32" x2="33.02" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="SUPPLY18" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="RESET_1"/>
<wire x1="-71.12" y1="17.78" x2="-91.44" y2="17.78" width="0.1524" layer="91"/>
<pinref part="SUPPLY19" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="ULTRA_CENTRO1" gate="G$1" pin="4"/>
<wire x1="-170.18" y1="-71.12" x2="-160.02" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY23" gate="GND" pin="GND"/>
<wire x1="-160.02" y1="-66.04" x2="-160.02" y2="-71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SL2" gate="G$1" pin="GND"/>
<wire x1="116.84" y1="137.16" x2="121.92" y2="137.16" width="0.1524" layer="91"/>
<wire x1="121.92" y1="137.16" x2="121.92" y2="139.7" width="0.1524" layer="91"/>
<pinref part="SUPPLY26" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC4" gate="1" pin="GND"/>
<pinref part="SUPPLY24" gate="GND" pin="GND"/>
<wire x1="68.58" y1="-152.4" x2="68.58" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-157.48" x2="63.5" y2="-157.48" width="0.1524" layer="91"/>
<junction x="68.58" y="-157.48"/>
<wire x1="63.5" y1="-157.48" x2="68.58" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-157.48" x2="73.66" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-157.48" x2="68.58" y2="-157.48" width="0.1524" layer="91"/>
<wire x1="53.34" y1="-160.02" x2="63.5" y2="-160.02" width="0.1524" layer="91"/>
<wire x1="63.5" y1="-160.02" x2="63.5" y2="-157.48" width="0.1524" layer="91"/>
<junction x="63.5" y="-157.48"/>
<wire x1="83.82" y1="-160.02" x2="73.66" y2="-160.02" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-160.02" x2="73.66" y2="-157.48" width="0.1524" layer="91"/>
<junction x="73.66" y="-157.48"/>
</segment>
<segment>
<pinref part="SERVO2" gate="SERVO" pin="GND"/>
<wire x1="-96.52" y1="91.44" x2="-91.44" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="91.44" x2="-91.44" y2="96.52" width="0.1524" layer="91"/>
<pinref part="SUPPLY25" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SL4" gate="G$1" pin="GND"/>
<wire x1="116.84" y1="91.44" x2="119.38" y2="91.44" width="0.1524" layer="91"/>
<wire x1="119.38" y1="93.98" x2="119.38" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SUPPLY29" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SL3" gate="G$1" pin="GND"/>
<wire x1="180.34" y1="93.98" x2="185.42" y2="93.98" width="0.1524" layer="91"/>
<wire x1="185.42" y1="93.98" x2="185.42" y2="96.52" width="0.1524" layer="91"/>
<pinref part="SUPPLY27" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="TB1" gate="G$1" pin="GND3"/>
<wire x1="33.02" y1="121.92" x2="53.34" y2="121.92" width="0.1524" layer="91"/>
<wire x1="53.34" y1="121.92" x2="53.34" y2="81.28" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="GND3"/>
<wire x1="53.34" y1="81.28" x2="33.02" y2="81.28" width="0.1524" layer="91"/>
<wire x1="53.34" y1="121.92" x2="60.96" y2="121.92" width="0.1524" layer="91"/>
<junction x="53.34" y="121.92"/>
<pinref part="SUPPLY30" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="TB1" gate="G$1" pin="GND1"/>
<wire x1="2.54" y1="147.32" x2="-5.08" y2="147.32" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="147.32" x2="-5.08" y2="106.68" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="GND1"/>
<wire x1="-5.08" y1="106.68" x2="2.54" y2="106.68" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="GND2"/>
<wire x1="2.54" y1="121.92" x2="-17.78" y2="121.92" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="121.92" x2="-17.78" y2="106.68" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="GND2"/>
<wire x1="-17.78" y1="106.68" x2="-17.78" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="81.28" x2="2.54" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="106.68" x2="-17.78" y2="106.68" width="0.1524" layer="91"/>
<junction x="-5.08" y="106.68"/>
<junction x="-17.78" y="106.68"/>
<wire x1="-17.78" y1="106.68" x2="-25.4" y2="106.68" width="0.1524" layer="91"/>
<pinref part="SUPPLY31" gate="GND" pin="GND"/>
</segment>
</net>
<net name="VCC_5V_SERVO" class="0">
<segment>
<pinref part="ENCODER" gate="G$1" pin="GND"/>
<pinref part="SUPPLY1" gate="G$1" pin="VCC"/>
<wire x1="-12.7" y1="-76.2" x2="-17.78" y2="-76.2" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ULTRA_DERECHO" gate="G$1" pin="1"/>
<wire x1="-177.8" y1="-25.4" x2="-172.72" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="SUPPLY3" gate="G$1" pin="VCC"/>
<wire x1="-172.72" y1="-27.94" x2="-172.72" y2="-25.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="ULTRA_IZQUIERDO" gate="G$1" pin="1"/>
<wire x1="-172.72" y1="86.36" x2="-167.64" y2="86.36" width="0.1524" layer="91"/>
<pinref part="SUPPLY5" gate="G$1" pin="VCC"/>
<wire x1="-167.64" y1="83.82" x2="-167.64" y2="86.36" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY7" gate="G$1" pin="VCC"/>
<wire x1="-160.02" y1="17.78" x2="-160.02" y2="27.94" width="0.1524" layer="91"/>
<pinref part="ULTRA_CENTRO" gate="G$1" pin="1"/>
<wire x1="-170.18" y1="27.94" x2="-160.02" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="MPU9250" gate="G$1" pin="1"/>
<wire x1="-15.24" y1="-132.08" x2="-17.78" y2="-132.08" width="0.1524" layer="91"/>
<pinref part="SUPPLY9" gate="G$1" pin="VCC"/>
<wire x1="-17.78" y1="-127" x2="-17.78" y2="-132.08" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SERVO" gate="SERVO" pin="5V"/>
<wire x1="-96.52" y1="-88.9" x2="-86.36" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="-88.9" x2="-86.36" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY13" gate="G$1" pin="VCC"/>
</segment>
<segment>
<pinref part="SUPPLY22" gate="G$1" pin="VCC"/>
<wire x1="-160.02" y1="-88.9" x2="-160.02" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="ULTRA_CENTRO1" gate="G$1" pin="1"/>
<wire x1="-170.18" y1="-78.74" x2="-160.02" y2="-78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SERVO2" gate="SERVO" pin="5V"/>
<wire x1="-96.52" y1="88.9" x2="-86.36" y2="88.9" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="88.9" x2="-86.36" y2="99.06" width="0.1524" layer="91"/>
<pinref part="SUPPLY28" gate="G$1" pin="VCC"/>
</segment>
</net>
<net name="TIGGER_D3" class="0">
<segment>
<pinref part="ULTRA_DERECHO" gate="G$1" pin="3"/>
<wire x1="-177.8" y1="-20.32" x2="-157.48" y2="-20.32" width="0.1524" layer="91"/>
<label x="-157.48" y="-20.32" size="1.778" layer="95" xref="yes"/>
<label x="-86.36" y="10.16" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="ECHO_F6" class="0">
<segment>
<pinref part="ULTRA_CENTRO" gate="G$1" pin="2"/>
<wire x1="-170.18" y1="30.48" x2="-167.64" y2="30.48" width="0.1524" layer="91"/>
<label x="-167.64" y="30.48" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="TIGGER_F7" class="0">
<segment>
<pinref part="ULTRA_CENTRO" gate="G$1" pin="3"/>
<wire x1="-170.18" y1="33.02" x2="-152.4" y2="33.02" width="0.1524" layer="91"/>
<label x="-152.4" y="33.02" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="ECHO_D8" class="0">
<segment>
<pinref part="ULTRA_DERECHO" gate="G$1" pin="2"/>
<wire x1="-177.8" y1="-22.86" x2="-172.72" y2="-22.86" width="0.1524" layer="91"/>
<label x="-172.72" y="-22.86" size="1.778" layer="95" xref="yes"/>
<label x="-73.66" y="-2.54" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="5VBAT" class="0">
<segment>
<pinref part="IC2" gate="1" pin="OUT"/>
<wire x1="76.2" y1="-83.82" x2="78.74" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-83.82" x2="78.74" y2="-88.9" width="0.1524" layer="91"/>
<pinref part="D2" gate="1" pin="A"/>
<wire x1="78.74" y1="-83.82" x2="83.82" y2="-83.82" width="0.1524" layer="91"/>
<junction x="78.74" y="-83.82"/>
<label x="83.82" y="-83.82" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="IC4" gate="1" pin="OUT"/>
<wire x1="76.2" y1="-144.78" x2="78.74" y2="-144.78" width="0.1524" layer="91"/>
<wire x1="78.74" y1="-144.78" x2="78.74" y2="-149.86" width="0.1524" layer="91"/>
<pinref part="D4" gate="1" pin="A"/>
<wire x1="78.74" y1="-144.78" x2="83.82" y2="-144.78" width="0.1524" layer="91"/>
<junction x="78.74" y="-144.78"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<pinref part="S1" gate="1" pin="P"/>
<pinref part="G1" gate="G1" pin="+"/>
<wire x1="38.1" y1="-81.28" x2="38.1" y2="-83.82" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="D1" gate="1" pin="A"/>
<pinref part="IC2" gate="1" pin="IN"/>
<wire x1="60.96" y1="-83.82" x2="58.42" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-83.82" x2="58.42" y2="-88.9" width="0.1524" layer="91"/>
<junction x="58.42" y="-83.82"/>
<wire x1="58.42" y1="-83.82" x2="53.34" y2="-83.82" width="0.1524" layer="91"/>
<pinref part="S1" gate="1" pin="S"/>
<wire x1="48.26" y1="-83.82" x2="53.34" y2="-83.82" width="0.1524" layer="91"/>
<junction x="53.34" y="-83.82"/>
<label x="55.88" y="-83.82" size="1.778" layer="95" rot="R90" xref="yes"/>
</segment>
<segment>
<pinref part="PIXY" gate="G$1" pin="VIN"/>
<wire x1="182.88" y1="35.56" x2="185.42" y2="35.56" width="0.1524" layer="91"/>
<wire x1="185.42" y1="35.56" x2="185.42" y2="30.48" width="0.1524" layer="91"/>
<wire x1="185.42" y1="30.48" x2="193.04" y2="30.48" width="0.1524" layer="91"/>
<label x="193.04" y="30.48" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VIN"/>
<wire x1="50.8" y1="-22.86" x2="45.72" y2="-22.86" width="0.1524" layer="91"/>
<label x="45.72" y="-22.86" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="VIN"/>
<wire x1="-35.56" y1="22.86" x2="-30.48" y2="22.86" width="0.1524" layer="91"/>
<label x="-30.48" y="22.86" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="D3" gate="1" pin="A"/>
<pinref part="IC4" gate="1" pin="IN"/>
<wire x1="60.96" y1="-144.78" x2="58.42" y2="-144.78" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-144.78" x2="58.42" y2="-149.86" width="0.1524" layer="91"/>
<junction x="58.42" y="-144.78"/>
<wire x1="58.42" y1="-144.78" x2="53.34" y2="-144.78" width="0.1524" layer="91"/>
<label x="55.88" y="-144.78" size="1.778" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="ENC" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="D2"/>
<wire x1="-71.12" y1="12.7" x2="-78.74" y2="12.7" width="0.1524" layer="91"/>
<label x="-78.74" y="12.7" size="1.778" layer="95" rot="R180" xref="yes"/>
<label x="-78.74" y="12.7" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="ENCODER" gate="G$1" pin="SEÑAL"/>
<wire x1="-17.78" y1="-81.28" x2="-17.78" y2="-86.36" width="0.1524" layer="91"/>
<label x="-17.78" y="-86.36" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="TIGGER_I11" class="0">
<segment>
<pinref part="ULTRA_IZQUIERDO" gate="G$1" pin="3"/>
<wire x1="-172.72" y1="91.44" x2="-152.4" y2="91.44" width="0.1524" layer="91"/>
<label x="-152.4" y="91.44" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="ECHO_I4" class="0">
<segment>
<pinref part="ULTRA_IZQUIERDO" gate="G$1" pin="2"/>
<wire x1="-172.72" y1="88.9" x2="-167.64" y2="88.9" width="0.1524" layer="91"/>
<label x="-167.64" y="88.9" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="A5"/>
<wire x1="-35.56" y1="7.62" x2="20.32" y2="7.62" width="0.1524" layer="91"/>
<wire x1="20.32" y1="7.62" x2="20.32" y2="38.1" width="0.1524" layer="91"/>
<pinref part="SL1" gate="G$1" pin="H3"/>
<wire x1="20.32" y1="38.1" x2="45.72" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="A4"/>
<wire x1="-35.56" y1="5.08" x2="27.94" y2="5.08" width="0.1524" layer="91"/>
<wire x1="27.94" y1="5.08" x2="27.94" y2="30.48" width="0.1524" layer="91"/>
<pinref part="SL1" gate="G$1" pin="H2"/>
<wire x1="27.94" y1="30.48" x2="45.72" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="SL1" gate="G$1" pin="LV"/>
<wire x1="86.36" y1="35.56" x2="96.52" y2="35.56" width="0.1524" layer="91"/>
<wire x1="96.52" y1="35.56" x2="96.52" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="3V3"/>
<wire x1="96.52" y1="-22.86" x2="81.28" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="SL1" gate="G$1" pin="HV"/>
<pinref part="IC1" gate="G$1" pin="+5V"/>
<wire x1="-35.56" y1="15.24" x2="10.16" y2="15.24" width="0.1524" layer="91"/>
<wire x1="10.16" y1="15.24" x2="10.16" y2="35.56" width="0.1524" layer="91"/>
<wire x1="10.16" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SS" class="0">
<segment>
<pinref part="PIXY" gate="G$1" pin="SPI_SS"/>
<wire x1="167.64" y1="38.1" x2="162.56" y2="38.1" width="0.1524" layer="91"/>
<label x="162.56" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="SPI_SS"/>
<wire x1="81.28" y1="-5.08" x2="83.82" y2="-5.08" width="0.1524" layer="91"/>
<label x="83.82" y="-5.08" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SPI_MISO"/>
<wire x1="81.28" y1="0" x2="83.82" y2="0" width="0.1524" layer="91"/>
<label x="83.82" y="0" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="PIXY" gate="G$1" pin="SPI_MISO"/>
<wire x1="167.64" y1="45.72" x2="162.56" y2="45.72" width="0.1524" layer="91"/>
<label x="162.56" y="45.72" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SPI_SCK"/>
<wire x1="81.28" y1="-2.54" x2="86.36" y2="-2.54" width="0.1524" layer="91"/>
<label x="86.36" y="-2.54" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="PIXY" gate="G$1" pin="SPI_SCK"/>
<wire x1="167.64" y1="43.18" x2="152.4" y2="43.18" width="0.1524" layer="91"/>
<label x="152.4" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SPI_MOSI"/>
<wire x1="81.28" y1="12.7" x2="83.82" y2="12.7" width="0.1524" layer="91"/>
<label x="83.82" y="12.7" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="PIXY" gate="G$1" pin="SPI_MOSI"/>
<wire x1="182.88" y1="43.18" x2="185.42" y2="43.18" width="0.1524" layer="91"/>
<label x="185.42" y="43.18" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="DZ1" gate="-2" pin="C"/>
<pinref part="DZ1" gate="-1" pin="C"/>
<wire x1="187.96" y1="-30.48" x2="175.26" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="G2" gate="G$1" pin="-"/>
<wire x1="175.26" y1="-30.48" x2="160.02" y2="-30.48" width="0.1524" layer="91"/>
<junction x="175.26" y="-30.48"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="G2" gate="G$1" pin="+"/>
<wire x1="160.02" y1="-12.7" x2="160.02" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="S2" gate="1" pin="P"/>
<wire x1="160.02" y1="-7.62" x2="162.56" y2="-7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="S2" gate="1" pin="S"/>
<wire x1="172.72" y1="-10.16" x2="172.72" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-12.7" x2="187.96" y2="-12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SEÑAL_SERV" class="0">
<segment>
<pinref part="SERVO" gate="SERVO" pin="SEÑAL"/>
<wire x1="-96.52" y1="-91.44" x2="-88.9" y2="-91.44" width="0.1524" layer="91"/>
<label x="-88.9" y="-91.44" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="D9"/>
<wire x1="-76.2" y1="-5.08" x2="-71.12" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="-76.2" y1="-5.08" x2="-76.2" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="-76.2" y1="-7.62" x2="-91.44" y2="-7.62" width="0.1524" layer="91"/>
<label x="-91.44" y="-7.62" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="DIR1" class="0">
<segment>
<pinref part="TB2" gate="G$1" pin="BIN1"/>
<wire x1="33.02" y1="96.52" x2="45.72" y2="96.52" width="0.1524" layer="91"/>
<wire x1="45.72" y1="96.52" x2="45.72" y2="137.16" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="BIN1"/>
<wire x1="45.72" y1="137.16" x2="33.02" y2="137.16" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="AIN1"/>
<wire x1="33.02" y1="147.32" x2="40.64" y2="147.32" width="0.1524" layer="91"/>
<wire x1="40.64" y1="147.32" x2="40.64" y2="106.68" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="AIN1"/>
<wire x1="40.64" y1="106.68" x2="33.02" y2="106.68" width="0.1524" layer="91"/>
<wire x1="45.72" y1="137.16" x2="45.72" y2="139.7" width="0.1524" layer="91"/>
<wire x1="45.72" y1="147.32" x2="40.64" y2="147.32" width="0.1524" layer="91"/>
<junction x="45.72" y="137.16"/>
<junction x="40.64" y="147.32"/>
<wire x1="45.72" y1="147.32" x2="45.72" y2="139.7" width="0.1524" layer="91"/>
<wire x1="45.72" y1="139.7" x2="55.88" y2="139.7" width="0.1524" layer="91"/>
<label x="55.88" y="139.7" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="A2"/>
<wire x1="-35.56" y1="0" x2="-25.4" y2="0" width="0.1524" layer="91"/>
<label x="-25.4" y="0" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="DIR2" class="0">
<segment>
<pinref part="TB1" gate="G$1" pin="AIN2"/>
<wire x1="33.02" y1="152.4" x2="38.1" y2="152.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="152.4" x2="38.1" y2="111.76" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="AIN2"/>
<wire x1="38.1" y1="111.76" x2="33.02" y2="111.76" width="0.1524" layer="91"/>
<wire x1="38.1" y1="152.4" x2="48.26" y2="152.4" width="0.1524" layer="91"/>
<junction x="38.1" y="152.4"/>
<pinref part="TB1" gate="G$1" pin="BIN2"/>
<wire x1="33.02" y1="132.08" x2="48.26" y2="132.08" width="0.1524" layer="91"/>
<wire x1="48.26" y1="132.08" x2="48.26" y2="91.44" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="BIN2"/>
<wire x1="48.26" y1="91.44" x2="33.02" y2="91.44" width="0.1524" layer="91"/>
<wire x1="48.26" y1="152.4" x2="48.26" y2="147.32" width="0.1524" layer="91"/>
<junction x="48.26" y="132.08"/>
<wire x1="48.26" y1="147.32" x2="48.26" y2="132.08" width="0.1524" layer="91"/>
<wire x1="48.26" y1="147.32" x2="55.88" y2="147.32" width="0.1524" layer="91"/>
<junction x="48.26" y="147.32"/>
<label x="55.88" y="147.32" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="A3"/>
<wire x1="-33.02" y1="2.54" x2="-35.56" y2="2.54" width="0.1524" layer="91"/>
<label x="-33.02" y="2.54" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="ENA" class="0">
<segment>
<label x="-22.86" y="-5.08" size="1.778" layer="95" xref="yes"/>
<pinref part="IC1" gate="G$1" pin="A0"/>
<wire x1="-35.56" y1="-5.08" x2="-22.86" y2="-5.08" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="TB1" gate="G$1" pin="STBY"/>
<wire x1="33.02" y1="142.24" x2="43.18" y2="142.24" width="0.1524" layer="91"/>
<wire x1="43.18" y1="142.24" x2="43.18" y2="101.6" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="STBY"/>
<wire x1="43.18" y1="101.6" x2="33.02" y2="101.6" width="0.1524" layer="91"/>
<wire x1="43.18" y1="142.24" x2="71.12" y2="142.24" width="0.1524" layer="91"/>
<junction x="43.18" y="142.24"/>
<label x="71.12" y="142.24" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="TRIGGER_T13" class="0">
<segment>
<pinref part="ULTRA_CENTRO1" gate="G$1" pin="3"/>
<wire x1="-170.18" y1="-73.66" x2="-152.4" y2="-73.66" width="0.1524" layer="91"/>
<label x="-152.4" y="-73.66" size="1.778" layer="95" font="fixed" xref="yes"/>
<label x="-152.4" y="-73.66" size="1.778" layer="95" font="fixed" xref="yes"/>
<label x="-30.48" y="-12.7" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
</net>
<net name="ECHO_T15" class="0">
<segment>
<pinref part="ULTRA_CENTRO1" gate="G$1" pin="2"/>
<wire x1="-170.18" y1="-76.2" x2="-162.56" y2="-76.2" width="0.1524" layer="91"/>
<label x="-162.56" y="-76.2" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
<segment>
<label x="-15.24" y="-2.54" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="D3"/>
<wire x1="-86.36" y1="10.16" x2="-71.12" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="D8"/>
<wire x1="-73.66" y1="-2.54" x2="-71.12" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="D13"/>
<wire x1="-35.56" y1="-12.7" x2="-30.48" y2="-12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="A1"/>
<wire x1="-35.56" y1="-2.54" x2="-15.24" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="V5V" class="0">
<segment>
<pinref part="SL2" gate="G$1" pin="5V"/>
<wire x1="116.84" y1="134.62" x2="121.92" y2="134.62" width="0.1524" layer="91"/>
<label x="121.92" y="134.62" size="1.778" layer="95" font="fixed" xref="yes"/>
<label x="193.04" y="-88.9" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
<segment>
<label x="116.84" y="88.9" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
<segment>
<pinref part="SL3" gate="G$1" pin="5V"/>
<wire x1="180.34" y1="91.44" x2="185.42" y2="91.44" width="0.1524" layer="91"/>
<label x="185.42" y="91.44" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
</net>
<net name="OUT_D" class="0">
<segment>
<pinref part="SL2" gate="G$1" pin="SEÑAL"/>
<wire x1="116.84" y1="132.08" x2="127" y2="132.08" width="0.1524" layer="91"/>
<label x="127" y="132.08" size="1.778" layer="95" font="fixed" xref="yes"/>
<label x="157.48" y="-91.44" size="1.778" layer="95" font="fixed" rot="R180" xref="yes"/>
</segment>
</net>
<net name="OUT_I" class="0">
<segment>
<pinref part="SL4" gate="G$1" pin="SEÑAL"/>
<wire x1="116.84" y1="86.36" x2="124.46" y2="86.36" width="0.1524" layer="91"/>
<label x="124.46" y="86.36" size="1.778" layer="95" font="fixed" xref="yes"/>
<label x="147.32" y="-93.98" size="1.778" layer="95" font="fixed" rot="R180" xref="yes"/>
</segment>
</net>
<net name="5VF" class="0">
<segment>
<wire x1="83.82" y1="-144.78" x2="86.36" y2="-144.78" width="0.1524" layer="91"/>
<label x="86.36" y="-144.78" size="1.778" layer="95" font="fixed" xref="yes"/>
<label x="-86.36" y="-78.74" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
<segment>
<label x="-86.36" y="99.06" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="D3"/>
<wire x1="147.32" y1="-93.98" x2="157.48" y2="-93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SEÑAL_SERVO_CAM" class="0">
<segment>
<label x="45.72" y="-2.54" size="1.778" layer="95" font="fixed" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="SERVO2" gate="SERVO" pin="SEÑAL"/>
<wire x1="-96.52" y1="86.36" x2="-88.9" y2="86.36" width="0.1524" layer="91"/>
<label x="-88.9" y="86.36" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="D33"/>
<wire x1="50.8" y1="-2.54" x2="45.72" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="OUT_C" class="0">
<segment>
<pinref part="SL3" gate="G$1" pin="SEÑAL"/>
<wire x1="180.34" y1="88.9" x2="187.96" y2="88.9" width="0.1524" layer="91"/>
<label x="187.96" y="88.9" size="1.778" layer="95" font="fixed" xref="yes"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="TB1" gate="G$1" pin="VM"/>
<wire x1="2.54" y1="157.48" x2="0" y2="157.48" width="0.1524" layer="91"/>
<wire x1="0" y1="157.48" x2="0" y2="116.84" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="VM"/>
<wire x1="0" y1="116.84" x2="2.54" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="TB1" gate="G$1" pin="VCC"/>
<wire x1="2.54" y1="152.4" x2="-2.54" y2="152.4" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="152.4" x2="-2.54" y2="111.76" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="VCC"/>
<wire x1="-2.54" y1="111.76" x2="2.54" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="TB1" gate="G$1" pin="A2"/>
<wire x1="2.54" y1="137.16" x2="-10.16" y2="137.16" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="137.16" x2="-10.16" y2="134.62" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="A2"/>
<wire x1="-10.16" y1="134.62" x2="-10.16" y2="96.52" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="96.52" x2="0" y2="96.52" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="B2"/>
<wire x1="0" y1="96.52" x2="2.54" y2="96.52" width="0.1524" layer="91"/>
<wire x1="2.54" y1="132.08" x2="-12.7" y2="132.08" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="132.08" x2="-12.7" y2="91.44" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="B2"/>
<wire x1="-12.7" y1="91.44" x2="0" y2="91.44" width="0.1524" layer="91"/>
<wire x1="0" y1="91.44" x2="2.54" y2="91.44" width="0.1524" layer="91"/>
<wire x1="0" y1="96.52" x2="0" y2="91.44" width="0.1524" layer="91"/>
<junction x="0" y="91.44"/>
<wire x1="-10.16" y1="134.62" x2="-33.02" y2="134.62" width="0.1524" layer="91"/>
<junction x="-10.16" y="134.62"/>
<wire x1="-33.02" y1="134.62" x2="-33.02" y2="127" width="0.1524" layer="91"/>
<pinref part="MOTOR1" gate="G$1" pin="-"/>
<wire x1="-33.02" y1="127" x2="-40.64" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="TB1" gate="G$1" pin="B1"/>
<wire x1="2.54" y1="127" x2="-15.24" y2="127" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="B1"/>
<wire x1="-15.24" y1="127" x2="-15.24" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="86.36" x2="2.54" y2="86.36" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="A1"/>
<wire x1="2.54" y1="142.24" x2="-7.62" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="142.24" x2="-7.62" y2="101.6" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="A1"/>
<wire x1="-7.62" y1="101.6" x2="2.54" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="127" x2="-15.24" y2="137.16" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="137.16" x2="-15.24" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="142.24" x2="-7.62" y2="142.24" width="0.1524" layer="91"/>
<junction x="-15.24" y="127"/>
<junction x="-7.62" y="142.24"/>
<wire x1="-15.24" y1="137.16" x2="-27.94" y2="137.16" width="0.1524" layer="91"/>
<junction x="-15.24" y="137.16"/>
<pinref part="MOTOR1" gate="G$1" pin="+"/>
<wire x1="-40.64" y1="142.24" x2="-27.94" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="142.24" x2="-27.94" y2="137.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="PMOTOR" class="0">
<segment>
<pinref part="TB2" gate="G$1" pin="PWMB"/>
<wire x1="33.02" y1="86.36" x2="50.8" y2="86.36" width="0.1524" layer="91"/>
<wire x1="50.8" y1="86.36" x2="50.8" y2="127" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="PWMB"/>
<wire x1="50.8" y1="127" x2="33.02" y2="127" width="0.1524" layer="91"/>
<pinref part="TB1" gate="G$1" pin="PWMA"/>
<wire x1="33.02" y1="157.48" x2="35.56" y2="157.48" width="0.1524" layer="91"/>
<pinref part="TB2" gate="G$1" pin="PWMA"/>
<wire x1="35.56" y1="157.48" x2="35.56" y2="116.84" width="0.1524" layer="91"/>
<wire x1="35.56" y1="116.84" x2="33.02" y2="116.84" width="0.1524" layer="91"/>
<wire x1="50.8" y1="127" x2="50.8" y2="154.94" width="0.1524" layer="91"/>
<wire x1="50.8" y1="154.94" x2="50.8" y2="157.48" width="0.1524" layer="91"/>
<wire x1="50.8" y1="157.48" x2="35.56" y2="157.48" width="0.1524" layer="91"/>
<junction x="50.8" y="127"/>
<junction x="35.56" y="157.48"/>
<wire x1="50.8" y1="154.94" x2="55.88" y2="154.94" width="0.1524" layer="91"/>
<junction x="50.8" y="154.94"/>
<label x="55.88" y="154.94" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="D5"/>
<wire x1="-71.12" y1="5.08" x2="-78.74" y2="5.08" width="0.1524" layer="91"/>
<label x="-78.74" y="5.08" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
<note version="8.4" severity="warning">
Since Version 8.4, EAGLE supports properties for SPICE simulation. 
Probes in schematics and SPICE mapping objects found in parts and library devices
will not be understood with this version. Update EAGLE to the latest version
for full support of SPICE simulation. 
</note>
</compatibility>
</eagle>
