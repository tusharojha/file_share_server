## File Share Platform in Dart

File share platform in Dart is a tool for sharing private files to people using a secure hash token.

It's developed in Dart using `shelf` & `shelf router`.

## Installing 
Follow the below commands to run the server in your local machine:

```dart
    dart pub get
    dart lib/file_share.dart
```

### Generating standalone executables using Dart2Native
You can create a standalone executable using Dart2Native using the following commands:

```dart
    dart compile exe lib/file_share.dart
```

You can find these files inside the [executables](./executables/) directory.

## Screenshots

![Home Screen](./screenshots/capture.png)
![File Share Screen](./screenshots/capture2.png)
![File Download Screen](./screenshots/capture3.png)