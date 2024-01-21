import 'package:eatmosphere/eatmosphere.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();

  Eatmosphere game = Eatmosphere();
  runApp(GameWidget(game: kDebugMode ? Eatmosphere() : game));
}
