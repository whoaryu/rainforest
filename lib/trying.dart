import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class trial extends StatelessWidget {
  const trial({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MasonryGridView.builder(
        itemCount: 16,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) => Opacity(
          opacity: 0.9,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/pic${index + 1}.png',
                ),
              )),
        ),
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
      ),
    );
  }
}
