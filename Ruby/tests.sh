#!/bin/bash

# put tests here!
rake test
if [ $? -eq 0 ]; then
  echo OK
else
  exit 1
fi
