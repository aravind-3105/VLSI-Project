# **VLSI-Project**
## **Problem Statement:**

Design a 4-bit carry look ahead (CLA) adder as shown in Fig. 1(i). Different modules of theCLA-adder are shown in Fig. 1(ii). Each output sum bit needs to drive an inverter of size Wp/Wn= 20λ/10λ,whereλ= 0.09μm. As shown in Fig. 1(iii), consider that input bits are available before the rising edge of the clock and the output should be computed and present at the next rising edge of the clock. You can choose any logic style (static, dynamic, mix) to implement the circuit.

<p align="center">
  <img src="Images/OverallDesign.png" />
</p>

**Technology Used:180nm**

## **Tools Used:**
1) ngspice
2) MAGIC Layout Design Tool
3) iverilog and gtkwave
### **Magic Layouts**
1) Propagate & Generate Block:
<p align="center">
  <img src="Images/Prop&GenBlock.png" />
</p>
2) Carry Look Ahead Block:
<p align="center">
  <img src="Images/CarryLookAheadBlock.png" />
</p>
3) Sum Block:
<p align="center">
  <img src="Images/SumBlock.png" />
</p>
4) 4-bit Carry Look Ahead Adder:
<p align="center">
  <img src="Images/CLA_Module.png" />
  <img src="Images/CLA_Trans.png" />
</p>
5) CLA combined with Flip-Flop: 
<p align="center">
  <img src="Images/Overall_Module.png" />
  <img src="Images/Overall_Trans.png" />
</p>


### **Verilog Simulation**
<p align="center">
  <img src="Images/Verilog.png" />
</p>
