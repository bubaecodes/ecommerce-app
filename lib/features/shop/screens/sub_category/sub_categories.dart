import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce_app/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner4,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Sub-Categories
              Column(
                children: [
                  ///Heading
                  TSectionHeading(title: 'Sports Shirts', onPressed: () {},),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}












