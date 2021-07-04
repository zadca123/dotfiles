#!/bin/bash

for x in "${@}";do
    7z a -t7z -m0=lzma2 -mx=9 -aoa -mfb=64 -md=32m -ms=on "${x}.7z" "$x"
    # 7z a -t7z data.7z -m0=lzma2 -mx=9 -aoa -mfb=64 -md=32m -ms=on -mhe data/
done
