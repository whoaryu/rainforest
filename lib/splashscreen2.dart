import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StackScreen extends StatelessWidget {
  // Corrected class name
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Stack(
            children: [
              _buildStaggeredGridView(),
              _buildImageLogos(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaggeredGridView() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: 16,
      itemBuilder: (context, index) =>
          _getImageFromAssets('pic${index + 1}'), // Dynamically fetch images
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
    );
  }

  Widget _buildImageLogos() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/welcome_to_login.svg'),
          Image.asset('assets/brand_name.png'),
          // Add more image logo widgets as needed
        ],
      ),
    );
  }

  Widget _getImageFromAssets(String imageName) {
    return Image.asset('assets/$imageName.png'); // Assuming .png files
  }
}
