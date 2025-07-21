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


.PHONY: dev build_runner build build_windows linux apk
