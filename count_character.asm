.data
msg1: .asciiz "Please insert a string\n"
msg2: .asciiz "Please insert a character\n" 
msg3: .asciiz "\nCharacter "
msg4: .asciiz " occurs in string "
msg5: .asciiz " times" 
str1: .word 4
.text

main:
	la $a0, msg1		#prompts user to enter string
	li $v0, 4
	syscall

	la $a0, str1
	la $a1, str1
	li $v0, 8		#reading string
	syscall


	la $a0, msg2		#prompts for character
	li $v0, 4
	syscall
	
	li $v0, 12		#reads a character
	syscall	
	move $t3, $v0		#t3 is char

	la $t4, str1		#t4 is str1
	
count_character:
	li $s0, 0		#count
	li $t0, 0		#i

cc_loop:
	add $t1, $t4, $t0	#gets the address for the string
	lb $t2, 0($t1)		#loads the appropriate byte
	beq $t2, $zero, cc_exit	#Branches when it gets to the end
	bne $t2, $t3, cc_skip	#If not equal repeats loop 
	add $s0, $s0, 1		#increments the count

cc_skip:
	add $t0, $t0, 1		#increments the index
	j cc_loop

cc_exit:
	la $a0, msg3		#prints the output of the program
	li $v0, 4
	syscall	

	move $a0, $t3
	li $v0, 11
	syscall

	la $a0, msg4
	li $v0, 4
	syscall

	la $a0, str1		#loads the input string and prints it
	li $v0, 4
	syscall

	add $a0, $s0, $zero
	li $v0, 1
	syscall
	
	la $a0, msg5
	li $v0, 4
	syscall
		
	li $v0,10 		#exits the program
	syscall	
	