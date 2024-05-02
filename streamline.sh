#!/bin/bash

set -euo pipefail
cd $(dirname $0)/

for filename in *.toml; do
  echo $filename
  yj -ty < $filename > yaml
  yj -yt < yaml > $filename
  rm yaml
done
