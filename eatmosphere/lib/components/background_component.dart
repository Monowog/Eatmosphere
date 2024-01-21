import 'package:eatmosphere/constants/globals.dart';
import 'package:eatmosphere/games/eatmosphere.dart';
import 'package:flame/components.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<Eatmosphere> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
  }
}
