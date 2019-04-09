// Program: Sum1toN.asm
// Computes RAM[1] = 1+2+ ... +n
// Usage: put a number (n) in RAM[0]

// this part sets up three variables
// n, i and sum

// set n to value of RAM[0]
@R0	// select register 0
D=M	// put contents of register 0 into D
@n 	// create and select  a variable 'n'
M=D	// set n to R0

// set i to 1
@i 	// create variable i
M=1	// i = 1

// set sum to 0
@sum 	// create variable sum
M=0 	// sum = 0

(LOOP)
	@i	// access variable i
	D=M	// first time D = 0
	@n	// access variable n
	D=D-M	// first time 0=0-0
	@STOP
	D;JGT	// if i > n goto STOP

	@sum	// select sum
	D=M	// put sum into DATA
	@i	// select i
	D=D+M	// DATA = DATA + i
	@sum	// select sum
	M=D	// sum = new sum
	@i	// select i
	M=M+1	// increase i
	@LOOP
	0;JMP	// loop!

(STOP)
	@sum	// select sum register
	D=M	// put sum into DATA
	@R1	// select RAM[1]
	M=D	// RAM[1] = sum

// infinit loop
(END)
	@END
	0;JMP
