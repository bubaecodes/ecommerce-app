import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            TProductImageSlider(),

            ///Product Details
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace, bottom: TSizes.defaultSpace, left: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Ratings & Share Button
                  TRatingAndShare(),

                  /// Price, Title, Stock & Brand
                  TProductMetaData()

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


// Attributes
// Checkout Button
// Description
// Review


