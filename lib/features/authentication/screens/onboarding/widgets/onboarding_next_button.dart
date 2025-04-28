import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:samu_mobile_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:samu_mobile_app/utils/constants/colors.dart';
import 'package:samu_mobile_app/utils/constants/sizes.dart';
import 'package:samu_mobile_app/utils/device/device_utility.dart';
import 'package:samu_mobile_app/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 40,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.light : TColors.dark,
        ),
        child: const Icon(
          Iconsax.arrow_right_3, // Dynamic color based on theme
        ),
      ),
    );
  }
}
