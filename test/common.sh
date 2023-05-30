
set -e

SCHREC="dist/schrec"

FAST="
addition-fork.scm
addition-serial.scm
block-order-dependent-1.scm
block-order-dependent-2.scm
block-order-dependent-3.scm
children-mismatch-multi.scm
const-multi.scm
const.scm
eval-in-pattern.scm
lisp-list-functions.scm
loop-1.scm
loop-2.scm
loop-pattern.scm
non-determinism-example-1.scm
non-determinism-example-2.scm
primitive-multi-2.scm
primitive.scm
simple-let-example.scm
simple-non-confluent.scm
state.scm
state-with-double-bind.scm
state-with-noop-2.scm
state-with-noop-3.scm
state-with-noop.scm
state-without-const.scm
state-without-local.scm
stupid-synthetic-example.scm
turing-machine.scm
"

NOHAGUP="
$FAST
gasm.scm
gstack.scm
lambda.scm
recursive-functions.scm
"

DET="
$NOHAGUP
primitive-multi.scm
shuffle-multi.scm
"

NONDET="
$FAST
gasm.scm
gstack.scm
primitive-multi.scm
recursive-functions.scm
shuffle-multi.scm
"

run_one() {
	FILE="$1"
	MODE="$2"
	TRACE="$3"
	ROOTAT="$4"

	case "$TRACE" in
		yestrace)
			TRACEFLAG='--trace'
			;;
		notrace)
			TRACEFLAG='--no-trace'
			;;
		*)
			echo "BAD TRACE VALUE $TRACE" 1>&2
			exit 1
			;;
	esac

	case "$ROOTAT" in
		rootatlast)
			ROOTATOPTION='--root-at last'
			;;
		rootatmodule)
			ROOTATOPTION='--root-at module'
			;;
		*)
			echo "BAD ROOTAT VALUE $ROOTAT" 1>&2
			exit 1
			;;
	esac

	QALIFIER="$MODE-$TRACE-$ROOTAT"
	LOAD="--load-specialty $PWD/src/extensions/eval-single-specialty.scm"

	test -z "$FILE" && return 0
	CMD="$SCHREC $LOAD --results $MODE $TRACEFLAG $ROOTATOPTION example/$FILE"
	echo "> $CMD"
	$CMD | head -n 1000 > "dist/test/examples/$QALIFIER/$FILE.txt"

	diff "test/expected-example-outputs/$QALIFIER/$FILE.txt" \
	     "dist/test/examples/$QALIFIER/$FILE.txt"
}

run_all() {
	LIST="$1"
	MODE="$2"
	TRACE="$3"
	ROOTAT="$4"

	QALIFIER="$MODE-$TRACE-$ROOTAT"
	mkdir -p "dist/test/examples/$QALIFIER"

	echo "$LIST" | while IFS= read -r FILE
	do
		run_one "$FILE" "$MODE" "$TRACE" "$ROOTAT"
	done
}

run_converts() {
	TYPE="$1"

	mkdir -p "dist/test/$TYPE-cases"
	ls "test/$TYPE-cases" | while IFS= read -r FILE
	do
		test -z "$FILE" && continue
		CMD="$SCHREC $TYPE test/$TYPE-cases/$FILE"
		echo "> $CMD"
		$CMD | head -n 1000 > "dist/test/$TYPE-cases/$FILE.txt"

		diff "test/expected-$TYPE-outputs/$FILE.txt" \
			 "dist/test/$TYPE-cases/$FILE.txt"
	done
}
