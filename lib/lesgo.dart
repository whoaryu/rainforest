import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rainforest/getsize.dart';

class Haha extends StatefulWidget {
  const Haha({Key? key}) : super(key: key);

  @override
  State<Haha> createState() => _HahaState();
}

class _HahaState extends State<Haha> {
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

  void _scrollToEndThenBeginning() {
    Future.delayed(const Duration(seconds: 1), () {
      scrollController
          .animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 48),
        curve: Curves.linear,
      )
          .then((_) {
        scrollController
            .animateTo(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.linear,
        )
            .then((_) {
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
        width: W.w100(context),
        height: H.h100(context),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: W.w100(context),
                height: H.h100(context),
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0.25, 0.75, 1],
                  ),
                ),
                child: MasonryGridView.builder(
                  controller: scrollController,
                  itemCount: 64,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    bool isLeftColumn = index % 2 == 0;
                    double offset = isLeftColumn ? 0.0 : 20.0;
                    Alignment alignment = isLeftColumn
                        ? Alignment.centerLeft
                        : Alignment.centerRight;
                    return Align(
                      alignment: alignment,
                      child: Transform.translate(
                        offset: Offset(0.0, isLeftColumn ? 0.0 : 30.0),
                        child: Opacity(
                          opacity: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/pic${index % 16 + 1}.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              Positioned(
                top: H.h10(context),
                left: W.w20(context),
                child: FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/welcome_to_login.svg'),
                      SvgPicture.asset('assets/onbaording_rainforest.svg')
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: H.h30(context),
                left: 0.0,
                right: 0.0,
                child: SvgPicture.asset('assets/onboarding_image_ask.svg'),
              ),
              Positioned(
                bottom: H.h25(context),
                left: 0.0,
                right: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/onboarding_dot1of3.svg'),
                ),
              ),
              Positioned(
                bottom: H.h10(context),
                left: W.w5(context),
                child: BounceInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: SizedBox(
                    height: H.h8(context),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // onboardingController.pageController
                            //       .nextPage(
                            //           duration: const Duration(
                            //               milliseconds: 400),
                            //           curve: Curves.easeIn);
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
