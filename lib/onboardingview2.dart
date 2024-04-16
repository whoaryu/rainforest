import 'package:aiportrait/app/data/utils/app_colors.dart';
import 'package:aiportrait/app/data/utils/app_string.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rainforest/onboardingview1.dart';
import 'package:video_player/video_player.dart';

import '../../../data/utils/custome_button.dart';
import '../../../data/utils/get_size.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  OnboardingController onboardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: H.h100(context),
            width: W.w100(context),
            child: AspectRatio(
              aspectRatio: onboardingController.controller.value.aspectRatio,
              child: VideoPlayer(onboardingController.controller),
            ),
          ),
          PageView.builder(
            controller: onboardingController.pageController,
            itemBuilder: (context, index) {
              if (index == 0) {
                FirstScreen();
              } else if (index == 1) {
                return SizedBox(
                  height: H.h100(context),
                  width: W.w100(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: H.h100(context) < 720
                            ? W.w2(context)
                            : W.w4(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: H.h10(context),
                            ),
                            child: SvgPicture.asset(
                                AppIcon.onBoardingQuotesASKCHITRA),
                          ),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 800),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(AppIcon.glass),
                                  Text(
                                    "“Woman Wearing white top,\ndark Background”",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors.onBoardingColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                  width: W.w33(context),
                                  child: Image.asset(AppIcon.onBoarding1)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: H.h1(context),
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: W.w23(context),
                                  child: Image.asset(AppIcon.onBoarding2)),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AppIcon.arrowOnboarding),
                                  SizedBox(
                                    height: H.h1(context),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(AppIcon.glass),
                                      Text(
                                        "“Photo of the face you want to \nuse”",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: AppColors.onBoardingColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: H.h3(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        FadeInDown(
                          duration: const Duration(milliseconds: 1200),
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  AppIcon.onboardingQuotesUSEyour)),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                """Set aside your cash and time in ideation and content creation. As by utilizing only one photograph of the individual, we can create limitless photograph with various prompts.""",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.onBoardingColorLight),
                              )),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        Center(child: SvgPicture.asset(AppIcon.onboardingDot1)),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        BounceInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: SizedBox(
                            height: H.h8(context),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    onboardingController.pageController
                                        .nextPage(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeIn);
                                  },
                                  child: Container(
                                    height: H.h8(context),
                                    width: W.w30(context),
                                    decoration: const BoxDecoration(
                                        color: AppColors.appColor,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: H.h100(context) < 720 ? 0 : H.h4(context),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: H.h100(context),
                  width: W.w100(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: H.h100(context) < 720
                            ? W.w2(context)
                            : W.w4(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            onboardingController.pageController.previousPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: H.h7(context)),
                            child: SvgPicture.asset(AppIcon.arrowBack),
                          ),
                        ),
                        SizedBox(
                          height: H.h1(context),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: SvgPicture.asset(AppIcon.onboarding2ImageAsk),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 800),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(AppIcon.glass),
                                  Text(
                                    "“Brown cute pup, looking into \ncamera sharp focus”",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors.onBoardingColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                  width: W.w33(context),
                                  child: Image.asset(AppIcon.onBoarding4)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: H.h1(context),
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: W.w33(context),
                                  child: Image.asset(AppIcon.onBoarding3)),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(AppIcon.glass),
                                  Text(
                                    "“sunrise, grassland, surreal, \nmasterpiece”",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: AppColors.onBoardingColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: H.h3(context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        FadeInDown(
                          duration: const Duration(milliseconds: 1200),
                          child: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(AppIcon.explainThePhoto)),
                        ),
                        SizedBox(
                          height: H.h2(context),
                        ),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                """Have an extraordinary photograph, yet need to change the individual in that photograph? Make identical photograph with only a face change.""",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.onBoardingColorLight),
                              )),
                        ),
                        SizedBox(
                          height: H.h100(context) < 712
                              ? H.h1(context)
                              : H.h2(context),
                        ),
                        Center(child: SvgPicture.asset(AppIcon.onboardingDot2)),
                        SizedBox(
                          height: H.h100(context) < 712
                              ? H.h1(context)
                              : H.h2(context),
                        ),
                        BounceInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: CustomButton(
                            buttonTitle: Text(
                              "Get Started",
                              style: GoogleFonts.poppins(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            borderRadius: 20,
                            borderColor: AppColors.appColor,
                            height: H.h6(context),
                            buttonColor: AppColors.appColor,
                            onPress: () async {
                              Get.toNamed(Routes.HOME_PAGE);
                            },
                          ),
                        ),
                        SizedBox(
                          height: H.h100(context) < 720 ? 0 : H.h4(context),
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
