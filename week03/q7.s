
N_SIZE = 10

main:

	# $t0 = i

main__loop_init:
	li	$t0, 0	# i = 0

main__loop_condition:
	blt	$t0, N_SIZE, main__loop_body	# while ( i < N_SIZE)
	j	main__loop_end
#	bge	$t0, N_SIZE, main__loop_end
main__loop_body:
	la	$t1, numbers
	mul	$t2, $t0, 4
	add	$t3, $t1, $t2	# $t3 = &numbers[i]
	lw	$t4, ($t3)	# $t4 = numbers[i]

	blt	$t4, 0, main__add42
	b	main__loop_incr
main__add42:
	addi	$t4, $t4, 42
	sw	$t4, ($t3)
main__loop_incr:
	addi	$t0, $t0, 1
	b	main__loop_condition

main__loop_end:
	jr	$ra

	
.data
numbers:
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
