import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTermsAndConditionCheckBox extends StatelessWidget {
  const TTermsAndConditionCheckBox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value){}),
        //const SizedBox(width: TSizes.spaceBtwItems - 15.5,),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${TTexts.iAgreeTo} ', style: TextStyle(fontSize: 10,) /*style: Theme.of(context).textTheme.bodySmall*/),
              TextSpan(text: '${TTexts.privacyPolicy} ', style: TextStyle(fontSize: 13, decoration: TextDecoration.underline) /*style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline
              )*/),
              TextSpan(text: '${TTexts.and} ', style: TextStyle(fontSize: 10) /*style: Theme.of(context).textTheme.bodySmall*/),
              TextSpan(text: TTexts.termsOfUse, style: TextStyle(fontSize: 13, decoration: TextDecoration.underline) /*style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline
              )*/),
            ]
          ),
        )
      ],
    );
  }
}