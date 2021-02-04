#!/bin/bash
# https://stackoverflow.com/questions/63627955/cant-load-shared-library-libqt5core-so-5
sudo strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5