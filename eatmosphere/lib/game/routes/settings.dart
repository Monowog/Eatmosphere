import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
    this.onBackPressed,
    this.onMusicValueChanged,
    this.onSfxValueChanged,
    required this.musicValueListenable,
    required this.sfxValueListenable,
  });

  static const id = 'Settings';

  final ValueListenable<bool> musicValueListenable;
  final ValueListenable<bool> sfxValueListenable;

  final VoidCallback? onBackPressed;
  final ValueChanged<bool>? onMusicValueChanged;
  final ValueChanged<bool>? onSfxValueChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 170,
            child: ValueListenableBuilder<bool>(
              valueListenable: musicValueListenable,
              builder: (BuildContext context, bool value, Widget? child) {
                return SwitchListTile(
                  value: value,
                  onChanged: onMusicValueChanged,
                  title: child,
                );
              },
              child: const Text('Music'),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 170,
            child: ValueListenableBuilder<bool>(
                valueListenable: sfxValueListenable,
                builder: (BuildContext context, bool value, Widget? child) {
                  return SwitchListTile(
                    value: value,
                    onChanged: onSfxValueChanged,
                    title: child,
                  );
                },
                child: const Text('SFX')),
          ),
          const SizedBox(height: 5),
          IconButton(
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ],
      )),
    );
  }
}
