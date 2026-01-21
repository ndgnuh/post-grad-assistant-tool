APP_HOME ?= "$(HOME)/Application/FamiSDH"
PREFIX ?= "$(HOME)/.local"
SYNC_DIR ?= "$(HOME)/Sync/FaMI_SDH"
APK_OUTPUT ?= "build/app/outputs/flutter-apk/app-release.apk"
GDK_SCALE := 2

dev:
	flutter run

dev-linux:
	flutter run -d linux

build_runner:
	dart run build_runner watch --delete-conflicting-outputs

build:
	flutter build linux --release

build_windows:
	flutter build windows --release

linux:
	flutter build linux --release

apk:
	flutter build apk --release

sync-apk:
	cp $(APK_OUTPUT) $(SYNC_DIR)/FaMI-PGMS.apk

install-apk: apk
	adb install $(APK_OUTPUT)

install: linux
	mkdir -p $(APP_HOME)
	cp build/linux/x64/release/bundle/* -r $(APP_HOME)/
	ln -fs $(APP_HOME)/fami-pgms $(PREFIX)/bin/fami-pgms

assets:
	fluttergen -c pubspec.yaml

.PHONY: dev build_runner build build_windows linux apk assets
