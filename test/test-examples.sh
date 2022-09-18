#! /bin/sh

set -e

SCHREC="dist/schrec"

DET="
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

run_mode() {
	MODE="$1"
	LIST="$2"

	mkdir -p "dist/test/examples/$MODE"
	echo "$LIST" | while IFS= read -r FILE
	do
		test -z "$FILE" && continue
		CMD="$SCHREC --trace --results $MODE example/$FILE"
		echo "> $CMD"
		$CMD | head -n 1000 > "dist/test/examples/$MODE/$FILE.txt"

		diff "test/expected-example-outputs/$MODE/$FILE.txt" \
		     "dist/test/examples/$MODE/$FILE.txt"
	done
}

run_mode "first" "$DET"
run_mode "all" "$NONDET"
run_mode "random" "$DET"

echo "All outputs match."
