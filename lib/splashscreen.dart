import 'package:flutter/material.dart';
import 'dart:async';

class StackScreen2 extends StatefulWidget {
  const StackScreen2({super.key});

  @override
  State<StackScreen2> createState() => _StackScreen2State();
}

class _StackScreen2State extends State<StackScreen2> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      // Update image positions (implementation needed)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildScrollingGridViewBackground(), // Background
          Positioned(
            bottom: 24.0, // Adjust for desired vertical offset
            left: 24.0, // Adjust for desired horizontal offset
            child: FloatingActionButton(
              onPressed: () {}, // Add your skip action here
              child: Text('Skip'),
              backgroundColor: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.end, // Position elements towards bottom
            children: [
              _buildImageLogos(), // Logos in the center
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Text(
                    'Ask Chitra to Create\nAny Photo',
                    style: TextStyle(
                      fontSize: 24, // Adjust font size as needed
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScrollingGridViewBackground() {
    return GridView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Disable default scrolling
      itemCount: 16,
      itemBuilder: (context, index) => _getImageFromAssets('pic${index + 1}'),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0, // Adjust for desired image width
        childAspectRatio:
            3 / 2, // Adjust for image aspect ratio (assuming portrait)
      ),
    );
  }

  Widget _getImageFromAssets(String imageName) {
    return Image.asset('assets/$imageName.png'); // Assuming .png files
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
}
