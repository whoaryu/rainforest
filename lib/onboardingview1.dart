import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rainforest/getsize.dart'; //change the address of this
//import assets from folder

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollToEndThenBeginning();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // Function to continuously scroll to the end then to the beginning
  void _scrollToEndThenBeginning() {
    Future.delayed(const Duration(seconds: 1), () {
      scrollController
          .animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 12), // Adjusted animation duration
        curve: Curves.linear,
      )
          .then((_) {
        // After reaching the end, scroll back to the beginning
        scrollController
            .animateTo(
          0,
          duration: Duration(seconds: 1), // Adjusted animation duration
          curve: Curves.linear,
        )
            .then((_) {
          // After reaching the beginning, call this function again for infinite scrolling
          _scrollToEndThenBeginning();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: W.w100(context), // Using the H and W classes for sizes
        height: H.h100(context),
        child: SafeArea(
          child: Stack(
            children: [
              MasonryGridView.builder(
                controller: scrollController,
                itemCount: 16,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  // Determine if it's in the left column or the right column
                  bool isLeftColumn = index % 2 == 0;
                  // Calculate the offset and alignment based on the column
                  double offset = isLeftColumn ? 0.0 : 20.0;
                  Alignment alignment = isLeftColumn
                      ? Alignment.centerLeft
                      : Alignment.centerRight;
                  return Align(
                    alignment: alignment,
                    child: Transform.translate(
                      offset: Offset(0.0, isLeftColumn ? 0.0 : 30.0),
                      child: Opacity(
                        opacity: 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/pic${index + 1}.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
                physics:
                    NeverScrollableScrollPhysics(), // Disable user scrolling
              ),
              Positioned(
                top: H.h5(context), // Using H class for positioning
                left: W.w5(context), // Using W class for positioning
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/welcome_to_login.svg'),
                      SvgPicture.asset('assets/onbaording_rainforest.svg')
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: H.h30(context), // Using H class for positioning
                left: 0.0,
                right: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/onboarding_2_image_ask.svg'),
                ),
              ),
              Positioned(
                bottom: H.h25(context), // Using H class for positioning
                left: 0.0,
                right: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/onboarding_dot1of3.svg'),
                ),
              ),
              Positioned(
                bottom: H.h10(context), // Using H class for positioning
                left: W.w5(context), // Using W class for positioning
                child: BounceInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: SizedBox(
                    height: H.h8(context),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // onboardingController.pageController
                            //     .nextPage(
                            //         duration: const Duration(
                            //             milliseconds: 400),
                            //         curve: Curves.easeIn);
                          },
                          child: Container(
                            height: H.h8(context),
                            width: W.w30(context),
                            decoration: const BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
