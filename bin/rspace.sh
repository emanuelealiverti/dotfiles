#!/bin/bash

# Remove commas, ' - ', and spaces.

for f in *\ *; do mv "$f" "${f//et al./etal}"; done
for f in *\ *; do mv "$f" "${f//,/}"; done
for f in *\ *; do mv "$f" "${f// - /_}"; done
for f in *\ *; do mv "$f" "${f// /_}"; done
for f in *\ *; do mv "$f" "${f//:/}"; done
