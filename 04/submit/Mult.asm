// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// setup index

// R0 is the counter
// R1 is the increasing sum

	@R2
	M=0

(LOOP)
	@R0
	D=M
	@END
	D;JLE	// jump if less than or equal to 0

	// R2 = R1 + R1
	@R1
	D=M
	@R2
	M=M+D

	// R0 = R0 - 1
	@R0
	D=M
	D=D-1	// decrease
	M=D	// put value back into register

	@LOOP
	0;JMP	// loop

(END)
	@END
	0;JMP // infinit loop