import 'package:ecommerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [

          ///Brands
          const TBrandShowcase(
            images: [TImages.productImage44, TImages.productImage44, TImages.productImage44],
          ),

          ///Products
          TSectionHeading(title: 'You might like', showActionButton: true, onPressed: (){}),
          const SizedBox(height: TSizes.spaceBtwItems)
        ],
      ),
    );
  }
}



















