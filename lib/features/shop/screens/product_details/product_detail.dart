import 'dart:convert';

import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:ecommerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    print(jsonEncode(product));
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            TProductImageSlider(product: product),

            ///Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
                left: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Ratings & Share Button
                  const TRatingAndShare(),

                  /// Price, Title, Stock & Brand
                  TProductMetaData(product: product),

                  /// Attributes
                  if (product.productType == ProductType.variable.toString()) TProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString()) const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),

                  /// Description
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    //'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am not the admin, so i do not know much description about the description.',
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3),
                        onPressed: () => Get.to(() => const ProductReviewsScreen()),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
