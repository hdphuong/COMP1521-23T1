


max:
max__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1
	push	$s2

	move	$s0, $a0	# $a0 = array[]
	move	$s1, $a1	# $a1 = length
max__body:
	lw	$s2, ($s0)	# $s2 = first_element = array[0]
	
	beq	$s1, 1, max__return_first_elem	# if length = 1

	add	$a0, $s0, 4	# &array[1]
	addi	$a1, $s1, -1	# length - 1
	jal	max		# max(&array[1], length - 1)
	move	$t0, $v0

	bgt	$s2, $t0, max__assign	# if (first_element > max_so_far)
	b	max__return
max__assign:
	move	$t0, $s2
	b	max__return
max__return:
	move	$v0, $t0	# return max_so_far
	b	max__epilogue
	
max__return_first_elem:
	move	$v0, $s2	# return first_element

max__epilogue:
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	end

	jr	$ra

### MAIN:	
main:
main__prologue:
	begin
	push	$ra

main__body:
	la	$a0, array
	li	$a1, 10
	jal	max			# result = max(array, 10)

	move	$a0, $v0
	li	$v0, 1			# syscall 1: print_int
	syscall				# printf("%d", result)

	li	$a0, '\n'
	li	$v0, 11			# syscall 11: print_char
	syscall				# printf("%c", '\n');

	li	$v0, 0

main__epilogue:
	pop	$ra
	end
	jr	$ra			# return 0;

.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, -1
