#!/bin/sh
# Regenerate template/MANIFEST.txt (every file in the template, including hidden ones).
cd "$(dirname "$0")/../template" && find . -type f ! -name MANIFEST.txt | sort > MANIFEST.txt
