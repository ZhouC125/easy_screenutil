# easy_screenutil

**A flutter plugin for adapting screen and font size.Let your UI display a reasonable layout on different screen sizes!**

*Note*: This plugin is simple and open to future improvements. Your feedback is welcome.

## Usage

### Add dependency

Please check the latest version before installation.
If there is any problem with the new version, please use the previous version

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add easy_screenutil
  easy_screenutil: ^{latest version}
```

### Add the following imports to your Dart code

```dart
import 'package:easy_screenutil/easy_screenutil.dart';
```

* 1、 Initialize by `ScreenUtil`.

```dart
void main() {
  ScreenUtil.ensureInitialized(designWidth: 375);
  runApp(const MyApp());
}
```

* 2、 init screen util  `ScreenUtil.builder`.

```dart
@override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: MyHomePage(title: 'Flutter Demo Home Page'),
    // init screen util
    builder: ScreenUtil.builder,
  );
}
```
