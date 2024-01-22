import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu(
      {super.key,
      this.onResumePressed,
      this.onSettingsPressed,
      this.onExitPressed});

  static const id = 'PauseMenu';

  final VoidCallback? onResumePressed;
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onExitPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(94, 220, 250, 255),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Paused',
            style: TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 130),
          SizedBox(
            width: 150,
            child: OutlinedButton(
                onPressed: onResumePressed, child: const Text('Resume')),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              onPressed: onSettingsPressed,
              child: const Text('Settings'),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              onPressed: onExitPressed,
              child: const Text('Exit to Main'),
            ),
          ),
        ],
      )),
    );
  }
}
