import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'screen_util.dart';


/// 一个自定义的 WidgetsFlutterBinding 子类
mixin ScreenRendererBinding on RendererBinding {
  @override
  ViewConfiguration createViewConfiguration() {
    return ViewConfiguration(
      size: Size(
          ScreenUtil.screenWidthDesign, window.physicalSize.height / (window.physicalSize.width / ScreenUtil.screenWidthDesign)),
      devicePixelRatio: window.physicalSize.width / ScreenUtil.screenWidthDesign,
    );
  }

}