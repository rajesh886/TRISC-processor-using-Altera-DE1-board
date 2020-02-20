module controller(
	input a,b,c,d,e,f,g,h,i,j,k,clock,clear,
	output reg C0,C11,C3,C4,C2,C7,C9,C8);
	reg[2:0] state,nextstate;
	parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101,G=3'b110,H=3'b111;
	always@(posedge clock, negedge clear)
		if(clear==0) state<=A;
			else state<= nextstate;
	always@(state,a,b,c,d,e,f,g,h,i,j,k)
		case(state)
			A: nextstate<=B;
			B: nextstate<=C;
			C: nextstate<=D;
			D: nextstate<=E;
			E: if(f) nextstate<=F; else if(g) nextstate<=G; else if(h) nextstate<=H;
			F: nextstate<=B;
			G: nextstate<=B;
			H: nextstate<=B;
		endcase
	always@(state)
		case(state)
			A:begin C0 = 1; C11=0; C3=0; C4=0; C2=0; C7=0; C9=0; C8=0;end
			B:begin C0 = 0; C11=0; C3=1; C4=0; C2=0; C7=0; C9=0; C8=0;end
			C:begin C0 = 0; C11=0; C3=0; C4=1; C2=0; C7=0; C9=0; C8=0;end
			D:begin C0 = 0; C11=0; C3=0; C4=1; C2=0; C7=0; C9=0; C8=0;end
			E:begin C0 = 0; C11=0; C3=0; C4=0; C2=1; C7=1; C9=0; C8=0;end
			F:begin C0 = 0; C11=0; C3=0; C4=0; C2=0; C7=0; C9=1; C8=0;end
			G:begin C0 = 0; C11=10; C3=0; C4=0; C2=0; C7=0; C9=0; C8=1;end
			H:begin C0 = 0; C11=1; C3=0; C4=0; C2=0; C7=0; C9=0; C8=0;end
		endcase
endmodule
	