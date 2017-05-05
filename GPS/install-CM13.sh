#!/usr/bin/env bash

# Gain root and remount filesystem with write permissions.
adb root
adb remount

# Patched GNSS driver (common).
adb push gps.default.so /system/lib/hw/       # Patched to use OpenSSL
adb push libcc_manager.so /system/lib/ 		  # From Stock. Needed for gps.default.so.
adb push libool.so /system/lib/               # Renamed OpenSSL (libssl.so)
adb push libcrptoo.so /system/lib/            # Renamed OpenSSL (libcrypto.so)
adb push libicuoc.so /system/lib/             # ICU56 compiled with missing ICU51 symbols and renamed to work under CM13.
adb push libwrappergps.so /system/lib/        # Missing in LineageOS 14.1
