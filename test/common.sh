
set -e

SCHREC="dist/schrec"

NOHAGUP="
addition-fork.scm
addition-serial.scm
block-order-dependent-1.scm
block-order-dependent-2.scm
block-order-dependent-3.scm
children-mismatch-multi.scm
const-multi.scm
const.scm
eval-in-pattern.scm
gasm.scm
gstack.scm
lambda.scm
lisp-list-functions.scm
loop-1.scm
loop-2.scm
loop-pattern.scm
non-determinism-example-1.scm
non-determinism-example-2.scm
primitive-multi-2.scm
primitive.scm
recursive-functions.scm
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

DET="
$NOHAGUP
primitive-multi.scm
shuffle-multi.scm
"

NONDET="
addition-fork.scm
addition-serial.scm
block-order-dependent-1.scm
block-order-dependent-2.scm
block-order-dependent-3.scm
children-mismatch-multi.scm
const-multi.scm
const.scm
eval-in-pattern.scm
gasm.scm
gstack.scm
lisp-list-functions.scm
loop-1.scm
loop-2.scm
loop-pattern.scm
non-determinism-example-1.scm
non-determinism-example-2.scm
primitive-multi-2.scm
primitive-multi.scm
primitive.scm
recursive-functions.scm
shuffle-multi.scm
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

run_one() {
	MODE="$1"
	TRACE="$2"
	FILE="$3"

	if test "$TRACE" = "yestrace"
	then TRACEFLAG="--trace"
	else TRACEFLAG='--no-trace'
	fi

	test -z "$FILE" && return 0
	CMD="$SCHREC --results $MODE $TRACEFLAG example/$FILE"
	echo "> $CMD"
	$CMD | head -n 1000 > "dist/test/examples/$MODE/$TRACE/$FILE.txt"

	diff "test/expected-example-outputs/$MODE/$TRACE/$FILE.txt" \
	     "dist/test/examples/$MODE/$TRACE/$FILE.txt"
}

run_all() {
	MODE="$1"
	TRACE="$2"
	LIST="$3"

	mkdir -p "dist/test/examples/$MODE/$TRACE"

	echo "$LIST" | while IFS= read -r FILE
	do
		run_one "$MODE" "$TRACE" "$FILE"
	done
}
