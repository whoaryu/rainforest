// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class StackScreen extends StatelessWidget {
//   const StackScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _buildStaggeredGridView(), // Background
//           Column(
//             mainAxisAlignment:
//                 MainAxisAlignment.end, // Position elements towards bottom
//             children: [
//               _buildImageLogos(), // Logos in the center
//               Padding(
//                 padding: const EdgeInsets.all(32.0),
//                 child: Center(
//                   child: Text(
//                     'Ask Chitra to create any photo',
//                     style: TextStyle(
//                       fontSize: 24, // Adjust font size as needed
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 32), // Space below text
//               FloatingActionButton(
//                 onPressed: () {}, // Add your skip action here
//                 child: Text('Skip'),
//                 backgroundColor: Colors.white,
//               ),
//               SizedBox(height: 32), // Bottom padding
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStaggeredGridView() {
//     return StaggeredGridView.countBuilder(
//       crossAxisCount: 2,
//       itemCount: 16,
//       itemBuilder: (context, index) =>
//           _getImageFromAssets('pic${index + 1}'), // Dynamically fetch images
//       staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//       mainAxisSpacing: 0.0,
//       crossAxisSpacing: 0.0,
//       scrollDirection: Axis.vertical,
//       physics: AlwaysScrollableScrollPhysics(),
//     );
//   }

//   Widget _buildImageLogos() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset('assets/welcome_to_login.svg'),
//           Image.asset('assets/brand_name.png'),
//           // Add more image logo widgets as needed
//         ],
//       ),
//     );
//   }

//   Widget _getImageFromAssets(String imageName) {
//     return Image.asset('assets/$imageName.png'); // Assuming .png files
//   }
// }
