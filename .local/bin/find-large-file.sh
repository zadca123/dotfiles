#!/bin/bash

find "$1" -mount -type f -size +50M -exec du -h "{}" \; | sort -n
