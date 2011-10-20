#!/bin/bash

set -eu

rm -rf ~/.irb*

cat <<-'TOKEN' > ~/.irbrc
require 'rubygems' unless defined? Gem # only needed in 1.8
require 'irbtools'
TOKEN

mkdir -p "$1"
irb 2>&1 | tee "$1"/output
cp -avr ~/.irb* "$1"/
(cd "$1" && rename 's/^\.//' .*)

# EOF