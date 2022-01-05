#!/usr/bin/env bash

set -e
set -x

TIMESTAMP=$(date "+%FT%H-%M-%S%Z")
for f in cv_*.pdf; do
    mv "$f" "$(basename "$f" .pdf)_$TIMESTAMP.pdf"
done
