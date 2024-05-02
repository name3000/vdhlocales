#!/bin/bash

set -euo pipefail
cd $(dirname $0)/

for filename in *.toml; do
  echo $filename
  yj -tj < $filename > /dev/null
done
