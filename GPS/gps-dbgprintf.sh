#!/usr/bin/env bash

# Gain root and remount filesystem with write permissions.
adb root
adb remount

# Restore the old GPS driver with DBGPRINTF working.
adb push gps.default.so-DBGPRINTF /system/lib/hw/gps.default.so

