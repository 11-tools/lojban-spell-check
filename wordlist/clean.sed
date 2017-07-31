#!/bin/sed -f
# Generic list cleaning

# Unify line endings
s/\r/\n/

# Unify spacing: convert tabs to spaces, remove duplicates
s/\t/ /
s/  +/ /

# Trim whitespaces
s/^ +//g
s/ +$//g

# Remove comments (lines starting with "#")
/^#/{
	b end
}

# Split entries with spaces
s/ /\n/g

# WARNING! sed will interpret split entries as one in the next lines. Chain with another sed invocation.

p

: end
