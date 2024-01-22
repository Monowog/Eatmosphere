import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Gameplay extends Component {
  Gameplay(this.difficulty);

  static const id = 'Gameplay';

  final int difficulty;

  @override
  Future<void> onLoad() async {
    final map = await TiledComponent.load('background.tmx', Vector2.all(16));
    await add(map);
  }
}
