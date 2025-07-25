APP_HOME ?= "$(HOME)/Applications/FamiSDH"
PREFIX ?= "$(HOME)/.local"

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

install-apk: apk
	adb install build/app/outputs/flutter-apk/app-release.apk

install: linux
	mkdir -p $(APP_HOME)
	cp build/linux/x64/release/bundle/* -r $(APP_HOME)/
	ln -fs $(APP_HOME)/fami_tools $(PREFIX)/bin/fami-sdh

.PHONY: dev build_runner build build_windows linux apk
