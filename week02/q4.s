main:
	# $t0 = x
	# $t1 = y

	li	$v0, 4
	la	$a0, input_str
	syscall

	li	$v0, 5
	syscall # put read value in $v0
	move	$t0, $v0

	mul	$t1, $t0, $t0 # y = x * x

	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall
	
	jr $ra
.data
	input_str:
		.asciiz "Enter a number: "
