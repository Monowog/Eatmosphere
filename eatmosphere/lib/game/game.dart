import 'dart:async';

import 'package:eatmosphere/game/routes/difficulty_selection.dart';
import 'package:eatmosphere/game/routes/gameplay.dart';
import 'package:eatmosphere/game/routes/main_menu.dart';
import 'package:eatmosphere/game/routes/pause_menu.dart';
import 'package:eatmosphere/game/routes/settings.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart' hide Route, OverlayRoute;

class EatmosphereGame extends FlameGame with HasKeyboardHandlerComponents {
  final musicValueNotifier = ValueNotifier(true);
  final sfxValueNotifier = ValueNotifier(true);

  late final _routes = <String, Route>{
    MainMenu.id: OverlayRoute(
      (context, game) => MainMenu(
        onPlayPressed: () => _routeById(DiffSelection.id),
        onSettingsPressed: () => _routeById(Settings.id),
      ),
    ),
    DiffSelection.id: OverlayRoute(
      (context, game) => DiffSelection(
        onDiffSelected: _startLevel,
        onBackPressed: _popRoute,
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
    PauseMenu.id: OverlayRoute(
      (context, game) => PauseMenu(
        onResumePressed: _resumeGame,
        onSettingsPressed: () => _routeById(Settings.id),
        onExitPressed: () {
          _resumeGame();
          _routeById(MainMenu.id);
        },
      ),
    )
  };

  late final _router = RouterComponent(
    initialRoute: MainMenu.id,
    routes: _routes,
  );

  @override
  FutureOr<void> onLoad() async {
    await add(_router);
  }

  void _routeById(String id) {
    _router.pushNamed(id);
  }

  void _popRoute() {
    _router.pop();
  }

  void _startLevel(int difficulty) {
    _router.pop();
    _router.pushReplacement(
      Route(() => Gameplay(
            difficulty,
            onPausePressed: _pauseGame,
          )),
      name: Gameplay.id,
    );
  }

  void _pauseGame() {
    _router.pushNamed(PauseMenu.id);
    pauseEngine();
  }

  void _resumeGame() {
    _router.pop();
    resumeEngine();
  }
}
