import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.firstName
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields - 9,),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastName
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TTexts.username,
              // hintStyle: TextStyle(
              //   color: darkMode ? TColors.textWhite : TColors.textPrimary
              // ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: TTexts.email
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: TTexts.phoneNo
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: TTexts.password
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections - 15,),

        ],
      ),
    );
  }
}