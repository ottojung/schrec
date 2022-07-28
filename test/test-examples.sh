#! /bin/sh

set -e

SCHREC="dist/schrec"
DET="
addition-fork.scm
addition-serial.scm
eval-in-pattern.scm
lambda.scm
loop-1.scm
loop-2.scm
non-determinism-example-1.scm
non-determinism-example-2.scm
primitive.scm
simple-let-example.scm
simple-non-confluent.scm
state.scm
stupid-synthetic-example.scm
"

NONDET="
addition-fork.scm
addition-serial.scm
eval-in-pattern.scm
loop-1.scm
loop-2.scm
non-determinism-example-1.scm
non-determinism-example-2.scm
primitive.scm
simple-let-example.scm
simple-non-confluent.scm
state.scm
stupid-synthetic-example.scm
"

mkdir -p dist/test/examples/det/
mkdir -p dist/test/examples/nondet/

echo "$DET" | while IFS= read -r FILE
do
	test -z "$FILE" && continue
	"$SCHREC" --trace --deterministic "example/$FILE" \
			  > "dist/test/examples/det/$FILE"

	diff "test/expected-example-outputs/det/$FILE" \
		 "dist/test/examples/det/$FILE"
done

echo "$NONDET" | while IFS= read -r FILE
do
	test -z "$FILE" && continue
	"$SCHREC" --trace --nondeterministic "example/$FILE" \
			  > "dist/test/examples/nondet/$FILE"

	diff "test/expected-example-outputs/nondet/$FILE" \
		 "dist/test/examples/nondet/$FILE"
done

echo "All outputs match."
