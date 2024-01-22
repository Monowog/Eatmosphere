import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/services.dart';

class Gameplay extends Component with KeyboardHandler {
  Gameplay(
    this.difficulty, {
    this.onPausePressed,
  });

  static const id = 'Gameplay';

  final int difficulty;
  final VoidCallback? onPausePressed;

  @override
  Future<void> onLoad() async {
    final map = await TiledComponent.load('background.tmx', Vector2.all(48));
    await add(map);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.escape)) {
      onPausePressed?.call();
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
