#!/bin/sed -f
# sed command file, to split entries of jbovlaste depending on their nature
# Writes each word category to a file with its name (ex: "cmavo") and stop processing other commands

# Skip empty lines
/^ *$/{
	b end
}

# cmevla
/[^aeiouy'\.,]$/{
	w cmevla
	b end
}

# Letters (.abu, by., etc.)
/^\.?[aeiouy]bu\.?$/{
	w vowel
	b end
}

/^[^aeiouy'\.,]y\.?$/{
	w consonant
	b end
}


# cmavo (simple, not compound)
# Notes:
#  - Regex allows following cmavo formats: V, VV, VVV+, CV, CVV, CVVV+, as specified in the CLL
#  - VVV+ and CVVV+ are experimental cmavo, as well as xV+. All those are accepted here.
#  - [^aeiouy] will actually accept the dot '.' in front of a voyel-starting cmavo, such as ".a".
# Reference: CLL chapter 4.2
/^[^aeiouy',]?[aeiouy](([^a-z]?[aeiouy])?)*.?$/{
	w cmavo
	b end
}

# Compound cmavo
/^([^aeiouy',]?[aeiouy](([^a-z]?[aeiouy])?)*.?)+$/{
	/[^aeiouy'\.,]{2,}/! {
		w cmavo_compound
		b end
	}
}

# brivla
# Reference: CLL chapter 4.3
/^.*[^aeiouy'\.,]{2,}.*[aeiouy]$/{
	w brivla
	b end
}

w other

: end
