import 'package:eatmosphere/components/background_component.dart';
import 'package:flame/game.dart';

class Eatmosphere extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
  }
}
