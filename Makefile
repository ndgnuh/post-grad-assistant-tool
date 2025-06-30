dev:
	flutter run -d linux

build_runner:
	dart run build_runner build --delete-conflicting-outputs

build:
	flutter build linux --release

build_windows:
	flutter build windows --release
