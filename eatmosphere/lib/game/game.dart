import 'dart:async';

import 'package:eatmosphere/game/routes/main_menu.dart';
import 'package:eatmosphere/game/routes/settings.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart' hide Route, OverlayRoute;

class EatmosphereGame extends FlameGame {
  final musicValueNotifier = ValueNotifier(true);
  final sfxValueNotifier = ValueNotifier(true);

  late final _routes = <String, Route>{
    MainMenu.id: OverlayRoute(
      (context, game) => MainMenu(
        onSettingsPressed: () => _routeById(Settings.id),
      ),
    ),
    Settings.id: OverlayRoute(
      (context, game) => Settings(
        musicValueListenable: musicValueNotifier,
        sfxValueListenable: sfxValueNotifier,
        onMusicValueChanged: (value) => musicValueNotifier.value = value,
        onSfxValueChanged: (value) => sfxValueNotifier.value = value,
        onBackPressed: _popRoute,
      ),
    ),
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

  void _routeById(String id) {
    _router.pushNamed(id);
  }

  void _popRoute() {
    _router.pop();
  }
}
