#! /bin/sh

for MODE in first all random
do
	for TRACE in yestrace notrace
	do
		for ROOTAT in rootatlast rootatmodule
		do
			FILE="test/test-examples-mode$MODE-$TRACE-$ROOTAT.sh"
			if test "$MODE" = first || test "$MODE" = random
			then
				if test "$TRACE" = yestrace
				then LIST='$DET'
				else LIST='$NOHAGUP'
				fi
			else
				if test "$TRACE" = yestrace
				then LIST='$NONDET'
				else LIST='$FAST'
				fi
			fi

			echo "#! /bin/sh" > "$FILE"
			echo ". test/common.sh" >> "$FILE"
			echo "run_all \"$LIST\" $MODE $TRACE $ROOTAT" >> "$FILE"
		done
	done
done
