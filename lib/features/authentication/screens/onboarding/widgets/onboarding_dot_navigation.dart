import 'package:flutter/material.dart';
import 'package:samu_mobile_app/utils/constants/colors.dart';
import 'package:samu_mobile_app/utils/device/device_utility.dart';
import 'package:samu_mobile_app/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:samu_mobile_app/features/authentication/controllers/onboarding/onboarding.controller.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 50,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 10,
        ),
      ),
    );
  }
}
