#!/usr/bin/env bash

# Gain root and remount filesystem with write permissions.
adb root
adb remount

# Patched RILD interace (not needed for CM13).
adb push rild.rc /system/etc/init/            # Removes old shims
adb push libril.so /system/lib/               # Patched to use old libbinder.so
adb push libbindrr.so /system/lib/            # Old libbinder.so renamed
adb push connfwexe /system/bin/               # Patched to use old libbinder.so and OpenSSL
adb push libsec-ril.so /system/lib/           # Patched to use OpenSSL
adb push libsecril-client.so /system/lib/     # Patched to use old libbinder.so

# Patched GNSS driver (common).
adb push gps.default.so /system/lib/hw/       # Patched to use OpenSSL
adb push libcc_manager.so /system/lib/ 		  # From Stock. Needed for gps.default.so.
adb push libool.so /system/lib/               # Renamed OpenSSL (libssl.so)
adb push libcrptoo.so /system/lib/            # Renamed OpenSSL (libcrypto.so)
adb push libicuoc.so /system/lib/             # ICU56 compiled with missing ICU51 symbols and renamed to work under CM13.
adb push libwrappergps.so /system/lib/        # Missing in LineageOS 14.1
