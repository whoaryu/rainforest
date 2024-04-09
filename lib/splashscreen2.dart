import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 24.0,
            left: 24.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/welcome_to_login.svg',
                  height: 50,
                ),
                const SizedBox(height: 8.0),
                Image.asset(
                  'assets/brand_name.png',
                  height: 30,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 150.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Ask Chitra to\nCreate Any Photo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 90.0,
            left: 24.0,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.navigate_next,
                color: Colors.black,
              ),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget _buildStaggeredGridView() {
//   return StaggeredGridView.countBuilder(
//     crossAxisCount: 2,
//     itemCount: 16,
//     itemBuilder: (context, index) =>
//         _getImageFromAssets('pic${index + 1}'), // Dynamically fetch images
//     staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//     mainAxisSpacing: 0.0,
//     crossAxisSpacing: 0.0,
//     scrollDirection: Axis.vertical,
//     physics: AlwaysScrollableScrollPhysics(),
//   );
// }

Widget _buildImageLogos() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/welcome_to_login.svg', height: 30),
        Image.asset(
          'assets/brand_name.png',
          height: 30,
        ),
      ],
    ),
  );
}

Widget _getImageFromAssets(String imageName) {
  return Image.asset('assets/$imageName.png');
}
