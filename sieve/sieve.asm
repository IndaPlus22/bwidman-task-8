#######
# The Sieve of Eratothenes algorithm
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
# Author: Benjamin Widman
#######

.data
primes:	.space	125	# Allocate 125 bytes as we need 1000 bits (1000/8=125)
# Every bit will represent a natural number up to 1000, if it is set equal to 1 it is not a prime number. Ex:
# 123456789
# 100101011

.text

main:
	li	$a0, 69
	li	$a1, 100
	li	$a2, 5
	li	$a3, 127
	li	$v0, 31
	syscall
	li	$a0, 105
	li	$v0, 32
	syscall
	j	main
	
#	li	$v0, 5
#	syscall		# Read integer (n)
	
#	li	$s0, 2	# Set p=2
#	la	$s1, primes	# Set s1 to address of primes
	
	
	# Exit
	li	$v0, 10
	syscall
