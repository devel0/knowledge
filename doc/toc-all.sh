#!/bin/env bash

for file in *.md; do
	echo "processing [$file]"
	markdown-toc2 "$file"
done

