import 'package:eatmosphere/games/eatmosphere.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GameWidget(game: Eatmosphere()));
}
