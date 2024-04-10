import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Trial extends StatefulWidget {
  const Trial({super.key});

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  int _currentIndex = 0;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 800), (_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 16; // Wrap around at 15
      });
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MasonryGridView.builder(
        itemCount: 16, // Placeholder for infinite scroll implementation
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Opacity(
          opacity: 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/pic${(_currentIndex + index) % 16 + 1}.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
