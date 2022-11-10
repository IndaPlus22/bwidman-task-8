#######
# The Sieve of Eratothenes algorithm
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
# Author: Benjamin Widman
#######

.macro	LOAD_BIT (%rs, %index)
	lb	%rs, primes
	
.end_macro

.macro SET_BIT (%index, %value)
	
.end_macro

.data
primes:	.space	125	# Allocate 125 bytes as we need 1000 bits (1000/8=125)
# Every bit will represent a natural number up to 1000, if it is set equal to 1 it is not a prime number. Ex:
# 123456789
# 100101011

.text

main:
	li	$v0, 5
	syscall		# Read integer (n)
	
	li	$s0, 2	# Set p=2
	la	$s1, primes	# Set s1 to address of primes
	
	
	# Exit
	li	$v0, 10
	syscall
	
load_bit:
	