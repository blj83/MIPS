.data
msg1: .asciiz "Please insert a string\n"
msg2: .asciiz "Please insert the character to be replaced\n"
msg3: .asciiz "\nPlease insert the character to replace with\n"
msg4: .asciiz "\nOriginal string: "
msg5: .asciiz "Substitute "
msg6: .asciiz " -> "
msg7: .asciiz "\nResult string: "
str1: .space 20
.text

main:
	la $a0, msg1		#prompts for string
	li $v0, 4
	syscall

	la $a0, str1		#stores the string
	li $v0, 8
	syscall
	
	la $a0, msg2		#prompts for character
	li $v0, 4
	syscall

	li $v0, 12
	syscall
	move $t3, $v0		#t3 replaced char

	la $a0, msg3		#prompts for character
	li $v0, 4
	syscall

	li $v0, 12
	syscall
	move $t4, $v0		#t4 replacing char

	la $t5, str1		#t5 string input

	la $a0, msg4		#printing original string
	li $v0, 4
	syscall	

	la $a0, str1		#prints original string
	li $v0, 4
	syscall	

replace_character:
	li $t0, 0		#t0 i

rc_loop:
	add $t1, $t5, $t0	#gets the address for the string
	lb $t2, 0($t1)		#loads the appropriate byte
	beq $t2, $zero, rc_exit	#Branches when it gets to the end
	bne $t2, $t3, rc_skip	#If not equal repeats loop 
	sb $t4, 0($t1) 		#changes the character

rc_skip:
	add $t0, $t0, 1		#increments the index
	j rc_loop

rc_exit:
	

	la $a0, msg5		#prints the result of the changes
	li $v0, 4
	syscall	

	move $a0, $t3
	li $v0, 11
	syscall	

	la $a0, msg6
	li $v0, 4
	syscall	

	move $a0, $t4
	li $v0, 11
	syscall	

	la $a0, msg7
	li $v0, 4
	syscall	

	move $a0, $t5
	li $v0, 4
	syscall	
	
	li $v0,10 		#exits the program
	syscall	