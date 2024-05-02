#!/bin/bash

set -euo pipefail
cd $(dirname $0)/

yj -jy < $1 | yq e ". as \$root | {} | .$2 = \$root" > patch.yaml
yj -ty < $2.toml > to_patch.yaml
yq '. *= load("patch.yaml")' to_patch.yaml | yj -yt > $2.toml
rm patch.yaml to_patch.yaml
