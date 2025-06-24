import 'package:ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce_app/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        ///Title, Price & Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
            Flexible(child: TProductTitleText(title: cartItem.title, maxLines: 1)),

            ///Attributes
            // Text.rich(
            //     TextSpan(
            //         children: [
            //           TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
            //           TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
            //           TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
            //           TextSpan(text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
            //         ]
            //     )
            // )

            Text.rich(
              TextSpan(
                children: (cartItem.selectedVariation ?? {}).entries.map(
                    (e) => TextSpan(
                      children: [
                        TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: ' ${e.value} ', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                    )
                ).toList()
              )
            ),
          ],
        )
      ],
    );
  }
}