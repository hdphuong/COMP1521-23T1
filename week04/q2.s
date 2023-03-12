

FLAG_ROWS=6
FLAG_COLS=12

main:
main__loop_row_init:
	li	$t0, 0	#int row = 0
main__loop_row_cond:
	bge	$t0, FLAG_ROWS, main__loop_row_end
main__loop_row_body:
main__loop_col_init:
	li	$t1, 0	# int col = 0
main__loop_col_cond:
	bge	$t1, FLAG_COLS, main__loop_col_end
main__loop_col_body:
	# array + offset
	# = array + (row * row_length + col) * size_of_each_element


	la	$t2, flag
	mul	$t3, $t0, FLAG_COLS
	add	$t3, $t3, $t1
	mul	$t3, $t3, 1		# offset of [row][col]
	add	$t3, $t3, $t2		# $t3 = &array[row][col]

	lb	$t4, ($t3)		# $t4 = array[row][col]


	move	$a0, $t4		# printf("%c", flag[row][col])
	li	$v0, 11
	syscall

	
main__loop_col_incr:
	addi	$t1, $t1, 1
	b	main__loop_col_cond
main__loop_col_end:
	li	$a0, '\n'		# printf("\n");
	li	$v0, 11
	syscall
main__loop_row_incr:
	addi	$t0, $t0, 1	# row++
	b	main__loop_row_cond
main__loop_row_end:

	jr	$ra

.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
