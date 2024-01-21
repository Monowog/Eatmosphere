import 'package:eatmosphere/game/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EatmosphereApp());
}

class EatmosphereApp extends StatelessWidget {
  const EatmosphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameWidget.controlled(gameFactory: EatmosphereGame.new),
    );
  }
}
