import 'package:flutter/material.dart';

class DiffSelection extends StatelessWidget {
  const DiffSelection({super.key, this.onDiffSelected, this.onBackPressed});

  static const id = 'DiffSelection';

  final ValueChanged<int>? onDiffSelected;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Difficulty Selection',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 150,
            child: OutlinedButton(
                onPressed: () => onDiffSelected?.call(1),
                child: const Text('Easy')),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              onPressed: () => onDiffSelected?.call(2),
              child: const Text('Hard'),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              onPressed: () => onDiffSelected?.call(3),
              child: const Text('Ludicrous'),
            ),
          ),
          const SizedBox(height: 35),
          IconButton(
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ],
      )),
    );
  }
}
