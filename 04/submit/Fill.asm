// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// set @scrsize to screensize 16*(16*32)-1
@8191
D=A
@scrsize
M=D

@i
M=D 	// set i to scrSize

@p
M=0	// pointer

(MAIN)
	// start with setting color to WHITE
	@color
	M=0

	// check keyboard
	@KBD
	D=M
	@BLACK
	D;JGT // jump to BLACK if key code is greater than 0
	
	@DRAW
	0;JMP

(BLACK)
	// set color to -1, (-1 sets all bits to 1)
	@color
	M=-1
	// jump to DRAW
	@DRAW
	0;JMP

(DRAW)
	// jump to LOOP if @i < 0
	@i
	D=M
	@LOOP
	D;JLT

	// add @i to @SCREEN address to get current RAM address
	@SCREEN
	D=A
	@i
	D=D+M
	// set pointer to current RAM address
	@p
	M=D

	// set current address to @color
	@color
	D=M
	@p	// pointer address
	A=M	// address = pointer address
	M=D	// set value in address to color

	// decrease @i index
	@i
	D=M
	M=D-1

	@DRAW
	0;JMP

(LOOP)
	// go back to main
	@scrsize
	D=M
	@i
	M=D
	@MAIN
	0;JMP