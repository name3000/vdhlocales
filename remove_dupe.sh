#!/bin/bash

set -euo pipefail
cd $(dirname $0)/

for filename in *.toml; do
  nl < $filename |sort -k 2|uniq -f 1|sort -n|cut -f 2 > $filename.2
  mv $filename.2 $filename
done
