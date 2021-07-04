#!/bin/bash

ebook-convert "$@" "${@//.mobi}".epub
