#!/bin/bash

killall "$@" || "$@"

exit