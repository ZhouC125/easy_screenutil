import 'dart:collection';
import 'dart:ui';
import 'package:easy_screenutil/src/screen_util.dart';
import 'package:flutter/gestures.dart';

mixin ScreenGestureBinding on GestureBinding {
  final Queue<PointerEvent> _pendingPointerEvents = Queue<PointerEvent>();

  @override
  void initInstances() {
    super.initInstances();
    platformDispatcher.onPointerDataPacket = _handlePointerDataPacket;
  }

  @override
  void unlocked() {
    super.unlocked();
    _flushPointerEventQueue();
  }

  void _handlePointerDataPacket(PointerDataPacket packet) {
    // We convert pointer data to logical pixels so that e.g. the touch slop can be
    // defined in a device-independent manner.
    final FlutterView view = platformDispatcher.implicitView!;
    _pendingPointerEvents.addAll(PointerEventConverter.expand(
        packet.data, (int index )=>view.physicalSize.width / ScreenUtil.screenWidthDesign));
    if (!locked) _flushPointerEventQueue();
  }


  void _flushPointerEventQueue() {
    assert(!locked);

    while (_pendingPointerEvents.isNotEmpty) {
      handlePointerEvent(_pendingPointerEvents.removeFirst());
    }
  }
}
