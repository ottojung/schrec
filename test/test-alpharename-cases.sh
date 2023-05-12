#! /bin/sh

set -e

SCHREC="dist/schrec"

mkdir -p "dist/test/alpharename-cases"
ls "test/alpharename-cases" | while IFS= read -r FILE
do
	test -z "$FILE" && continue
	CMD="$SCHREC alpharename test/alpharename-cases/$FILE"
	echo "> $CMD"
	$CMD | head -n 1000 > "dist/test/alpharename-cases/$FILE.txt"

	diff "test/expected-alpharename-outputs/$FILE.txt" \
		 "dist/test/alpharename-cases/$FILE.txt"
done

echo "All outputs match."
