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
lisp-list-functions.scm
loop-1.scm
loop-2.scm
loop-pattern.scm
non-determinism-example-1.scm
non-determinism-example-2.scm
primitive-multi-2.scm
primitive-multi.scm
primitive.scm
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
"

mkdir -p dist/test/examples/det/
mkdir -p dist/test/examples/nondet/

echo "$DET" | while IFS= read -r FILE
do
	test -z "$FILE" && continue
	CMD="$SCHREC --trace --results first example/$FILE"
	echo "> $CMD"
	$CMD | head -n 1000 > "dist/test/examples/det/$FILE.txt"

	diff "test/expected-example-outputs/det/$FILE.txt" \
	     "dist/test/examples/det/$FILE.txt"
done

echo "$NONDET" | while IFS= read -r FILE
do
	test -z "$FILE" && continue
	CMD="$SCHREC --trace --results all example/$FILE"
	echo "> $CMD"
	$CMD | head -n 1000 > "dist/test/examples/nondet/$FILE.txt"

	diff "test/expected-example-outputs/nondet/$FILE.txt" \
	     "dist/test/examples/nondet/$FILE.txt"
done

echo "All outputs match."
