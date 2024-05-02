#!/bin/bash

set -euo pipefail
cd $(dirname $0)/

for filename in *.toml; do
  sort $filename > tmp
  mv tmp $filename
done
