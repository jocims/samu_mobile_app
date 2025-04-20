import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samu_mobile_app/features/authentication/controllers/onboarding/onboarding.controller.dart';
import 'package:samu_mobile_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:samu_mobile_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:samu_mobile_app/utils/constants/image_strings.dart';
import 'package:samu_mobile_app/utils/constants/text_strings.dart';
import 'package:samu_mobile_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:samu_mobile_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubtitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
