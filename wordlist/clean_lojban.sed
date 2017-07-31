#!/bin/sed -f
# sed commands to clean Lojban entries

# Remove too long entries
/.{22,}/{
	b end
}

# To lowercase
s/(.*)/\L\1/

# Prepend a dot '.' before words begining with a vowel
s/^([aeiouy].*)$/\.\1/

# Fix 'y', which is written ".y." in the ref docs.
s/^\.y$/\.y\./

# Remove non-ansi entries
# Note: a-zA-Z seem to include accented characters!
/[^abcdefg'ijklmnoprstuvxyz\., \t]/{
	b end
}

# Remove empty lines and print
/^$/!p


: end
