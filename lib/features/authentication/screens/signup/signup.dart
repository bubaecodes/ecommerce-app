import 'package:ecommerce_app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_app/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace - 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections - 7,),

              ///First & Last Name
              const TSignupForm(),

              ///Terms & Conditions CheckBox
              const TTermsAndConditionCheckBox(),
              const SizedBox(height: TSizes.spaceBtwSections - 15),

              ///Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const VerifyEmailScreen()),
                  child: const Text(TTexts.createAccount),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections - 12),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections - 13),

              ///Social Buttons
              const TSocialButtons(),
              //const SizedBox(height: TSizes.spaceBtwSections - 10),
            ],
          ),
        ),
      ),
    );
  }
}









