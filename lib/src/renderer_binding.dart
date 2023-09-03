import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'screen_util.dart';

/// 一个自定义的 WidgetsFlutterBinding 子类
mixin ScreenRendererBinding on RendererBinding {
  @override
  ViewConfiguration createViewConfiguration() {
    final FlutterView view = platformDispatcher.implicitView!;
    return ViewConfiguration(
      size: Size(
          ScreenUtil.screenWidthDesign,
          view.physicalSize.height / (view.physicalSize.width / ScreenUtil.screenWidthDesign)
      ),
      devicePixelRatio: view.physicalSize.width / ScreenUtil.screenWidthDesign,
    );
  }
}
