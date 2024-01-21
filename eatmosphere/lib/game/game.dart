import 'dart:async';

import 'package:eatmosphere/game/routes/main_menu.dart';
import 'package:flame/game.dart';

class EatmosphereGame extends FlameGame {
  final _routes = <String, Route>{
    MainMenu.id: OverlayRoute((context, game) => const MainMenu())
  };

  late final _router = RouterComponent(
    initialRoute: MainMenu.id,
    routes: _routes,
  );

  @override
  FutureOr<void> onLoad() async {
    await add(_router);
    // final map = await TiledComponent.load('background.tmx', Vector2.all(16));
    // await add(map);
  }
}
