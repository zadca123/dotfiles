#!/bin/bash

pidof transmission-daemon >/dev/null || transmission-daemon

exit
