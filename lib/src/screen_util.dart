import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'gesture_binding.dart';
import 'renderer_binding.dart';

/// @description :
/// @class : screen_util
/// @date :  2023/8/15 21:04
/// @name : achen
class ScreenUtil {

  ///设计稿宽度
  static late final double _screenWidthDesign;

  static final ScreenUtil _instance = ScreenUtil._();

  static double get screenWidthDesign => _screenWidthDesign;

  ScreenUtil._();


  factory ScreenUtil() => _instance;

  /// Manually wait for window size to be initialized
  ///
  /// `Recommended` to use before you need access window size
  /// or in custom splash/bootstrap screen [FutureBuilder]
  ///
  /// example:
  /// ```dart
  /// ...
  /// ScreenUtil.init(context, ...);
  /// ...
  ///   FutureBuilder(
  ///     future: Future.wait([..., ensureScreenSize(), ...]),
  ///     builder: (context, snapshot) {
  ///       if (snapshot.hasData) return const HomeScreen();
  ///       return Material(
  ///         child: LayoutBuilder(
  ///           ...
  ///         ),
  ///       );
  ///     },
  ///   )
  /// ```

  static WidgetsBinding ensureInitialized({
    required double designWidth,
  }) {
    _screenWidthDesign = designWidth;
   return ScreenWidgetsFlutterBinding.ensureInitialized();
  }


  static Widget builder(
      BuildContext context,
      Widget? child, {
        double? textScaleFactor = 1,
      }) {
    child ??= const SizedBox.shrink();
    final MediaQueryData? maybeData = MediaQuery.maybeOf(context);
    if (maybeData == null) {
      return child;
    }

    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
            size: Size(
                screenWidthDesign,
                MediaQuery.of(context).size.height /
                    (MediaQuery.of(context).size.width / screenWidthDesign)),
            devicePixelRatio: MediaQuery.of(context).size.width / screenWidthDesign),
        child: child);
  }

}



class ScreenWidgetsFlutterBinding extends WidgetsFlutterBinding
    with ScreenGestureBinding ,ScreenRendererBinding{
  static WidgetsBinding ensureInitialized() {
    if (ScreenWidgetsFlutterBinding._instance == null) {
      ScreenWidgetsFlutterBinding._();
    }
    return WidgetsBinding.instance;
  }

  static ScreenWidgetsFlutterBinding? _instance;

  ScreenWidgetsFlutterBinding._() : super() {
    _instance = this;
  }
}
