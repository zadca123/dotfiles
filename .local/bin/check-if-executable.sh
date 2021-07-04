#!/bin/bash

# [ -r file ] tests if a file is readable.
# [ -w file ] tests if a file is writeable.
# [ -x file ] tests if a file is executable.

if [ -x file ]; then
  ./file
else
  echo "File is not executable"
fi
