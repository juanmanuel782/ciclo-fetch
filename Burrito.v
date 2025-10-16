module Burrito (
	input [4:0]Dir1,
	input [4:0]Dir2,
	input [4:0]DirEscritura
	);

//2. 
wire [31:0]C1,C2,C3;

ADD tortilla (
	.op1(C1),
	.op2(C2),
	.Resultado(C3)
	);

BR Relleno(
	.AR1(Dir1),
	.AR2(Dir2),
	.AWrite(DirEscritura),
	.DataIn(C3),
	.RegWrite(1),
	.DR1(C1),
	.DR2(C2)
	);


endmodule
