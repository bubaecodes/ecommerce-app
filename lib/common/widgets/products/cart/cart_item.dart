import 'package:ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(
          imageUrl: TImages.productImage21,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        ///Title, Price & Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TBrandTitleWithVerifiedIcon(title: 'Nike'),
            const Flexible(child: TProductTitleText(title: 'Black Sports Shoes', maxLines: 1)),

            ///Attributes
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                )
            )
          ],
        )
      ],
    );
  }
}