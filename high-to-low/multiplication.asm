.data
	
	
.text

main:
	li	$v0, 5	# Set syscall to read integer
	syscall		# Read integer
	move	$a0, $v0
	li	$v0, 5
	syscall		# Read integer
	move	$a1, $v0
	
	jal	multiply	# Move to multiply and save return adress
	
	# Print result
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	# Exit
	li	$v0, 10
	syscall

multiply:
	# Numbers to be multiplied (a & b) in a0 & a1
	# Count (i) at t0
	# Result (sum) in v0
	li	$t0, 1	# Set i=1
	li	$v0, 0	# Set sum=0
	for:
		add	$v0, $v0, $a1	# Add b to sum
		addi	$t0, $t0, 1	# Add 1 to i
		ble	$t0, $a0, for	# Jump to for if i<a

	jr	$ra	# Jump to return adress