#######
# The Sieve of Eratothenes algorithm
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
# Author: Benjamin Widman
#######

.data
primes:	.space	1000	# Allocate 1000 bytes
# Every byte represents a natural number up to 1000, if it is set equal to 1 it is not a prime number.

.text

main:
	li	$v0, 5
	syscall		# Read integer (n)
	
	li	$s0, 2	# Set p=2
	la	$s1, primes	# Set s1 to address of primes
	
	
	# Exit
	li	$v0, 10
	syscall
