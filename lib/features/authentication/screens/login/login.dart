import 'package:ecommerce_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_app/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              const TLoginHeader(),

              ///Form
              const TLoginForm(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtwSections - 10),

              ///Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
