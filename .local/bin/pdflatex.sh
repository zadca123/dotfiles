#!/bin/bash

pdflatex -interaction nonstopmode "$1"
# pdflatex -interaction nonstopmode "$1" "${1%.*}.pdf"
