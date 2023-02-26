main:
	# $t0 = n

	li	$v0, 4 
	la	$a0, input_str
	syscall

	li	$v0, 5		# scanf("%d", &n)
	syscall
	move	$t0, $v0

	li	$t1, 1 # int fac = 1;
	li	$t2, 1	# int i = 1

main__loop_condition:
	ble	$t2, $t0, main__loop_body
	b	main__loop_end

main__loop_body:
	mul	$t1, $t1, $t2

main__loop_inc:
	addi	$t2, $t2, 1
	b	main__loop_condition

main__loop_end:
	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall


	jr $ra
.data
	input_str:
		.asciiz "n = "

