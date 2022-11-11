#########################
# The Sieve of Eratothenes algorithm
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
# Author: Benjamin Widman
#########################

.data
numbers:	.space	1000	# Allocate 1000 bytes
# Every byte represents a natural number up to 1000, if it is set equal to 1 it is not a prime number.

.text
main:
	li	$s7, 1		# Constant = 1
	
	li	$v0, 5		# Set to read integer
	syscall			# Read integer (n)
	move	$s0, $v0	# Move n to s0
	
	sb	$s7, numbers	# 1 (first number) is not a prime, set byte to 1
	li	$s2, 2		# Start with p=2
	
	sieve:
	# Loop through multiples of p
	li	$t1, 2			# Multiplier = 2
	multiples:
	mul	$t2, $s2, $t1		# Number = p * multiplier
	sub	$t3, $t2, 1		# Index = number - 1
	sb	$s7, numbers($t3)	# Store 1 in index
	add	$t1, $t1, 1		# Multiplier++
	blt	$t2, $s0, multiples	# Loop if number < n
		
	primeloop:
	# Search for the next prime
	add	$t0, $t0, 1		# Add 1 to index
	lb	$s1, numbers($t0)	# Load value in index
	bne	$s1, $zero, primeloop	# Loop if next prime not found (value != 0)
	# Prime found
	add	$s2, $t0, 1		# p = index + 1
	
	blt	$s2, $s0, sieve	# Find new multiples if p < n
	
	# All composite numbers less than n found!
	# Print all primes (bytes == 0)
	li	$t0, 0		# Reset index to 0
	sub	$s0, $s0, 1	# Subtract 1 from n to represent as index
	
	print:
	lb	$s1, numbers($t0)	# Load value in index
	
	bne	$s1, $zero, noprint	# Don't print if value != 0
	
	add	$a0, $t0, 1	# Prime value to print is index + 1
	li	$v0, 1		# Set to print integer
	syscall			# Print
	li	$v0, 11		# Set to print character
	li	$a0, 10		# ASCII of newline is 10
	syscall			# Print newline character
	noprint:
	
	add	$t0, $t0, 1	# Increment index
	blt	$t0, $s0, print # Continue printing if index < n
	
	# Exit
	li	$v0, 10
	syscall
