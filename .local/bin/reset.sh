#!/bin/bash

killall "$@" || "$@"

exit
