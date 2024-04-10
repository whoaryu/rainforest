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
          MasonryGridView.builder(
            itemCount: 16,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Opacity(
              opacity: 0.4,
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
          Positioned(
            top: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset(
                //   'assets/welcome_to_login.svg',
                //   height: 50,
                // ),
                Text(
                  'Welcome To',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),

                Container(
                  width: 600,
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/brand_name.png',
                  ),
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
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.purple,
                ),
                SizedBox(
                  width: 15,
                ),
                Text('Skip', style: TextStyle(color: Colors.white)),
              ],
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

// Widget _buildImageLogos() {
//   return Center(
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset('assets/welcome_to_login.svg', height: 30),
//         Image.asset(
//           'assets/brand_name.png',
//           height: 30,
//         ),
//       ],
//     ),
//   );
// }

// Widget _getImageFromAssets(String imageName) {
//   return Image.asset('assets/$imageName.png');
// }
