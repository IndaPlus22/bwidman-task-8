.data
	
	
.text

main:
	li	$v0, 5	# Set syscall to read integer
	syscall		# Read integer
	move	$a0, $v0
	#li	$v0, 5
	#syscall		# Read integer
	#move	$a1, $v0
	
	jal	faculty	# Move to multiply and save return adress
	
	# Print result
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	# Exit
	li	$v0, 10
	syscall

multiply:
	# a*b where a=a0 & b=a1
	# Count (i) at t0
	# Result (sum) in v0
	li	$t0, 1	# Set i=1
	li	$v0, 0	# Set sum=0
	loop1:
		add	$v0, $v0, $a1	# Add b to sum
		addi	$t0, $t0, 1	# Add 1 to i
		ble	$t0, $a0, loop1	# Jump to loop1 if i<a

	jr	$ra	# Jump to return adress

faculty:
	# n! where n=a0
	# Result temporarely in t1
	move	$s0, $ra	# Save return address
	move	$s1, $a0	# i=n
	li	$v0, 1		# fac=1
	loop2:
		move	$a0, $v0	# Parameter 1=fac
		move	$a1, $s1	# Parameter 2=i
		jal	multiply	# multiply(fac, i)
		
		addi	$s1, $s1, -1	# i=i-1
		slti	$at, $s1, 2	# at=(i<2)
		beq	$at, $zero, loop2 # Jump to loop2 if i>=2
	
	jr	$s0	# Return
	
	

	
	
	
	
	