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
      body: Stack(
        children: [
          MasonryGridView.builder(
            mainAxisSpacing: 5,
            itemCount: 16, // Placeholder for infinite scroll implementation
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Opacity(
              opacity: 0.4,
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
                Text('Skip',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
