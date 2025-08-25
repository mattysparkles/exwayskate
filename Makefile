setup:
flutter pub get
run:
flutter run -d all
build-android:
flutter build apk --debug

# Golden tests and screenshot generation

goldens:
    flutter test && dart run tool/gen_screens.dart
