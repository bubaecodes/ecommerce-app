import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce_app/data/repositories/banners/banner_repository.dart';
import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ecommerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/dummy_data/dummy_data.dart';
import 'package:ecommerce_app/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/categories/category_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final prController = Get.put(ProductRepository());
    final cController = Get.put(CategoryRepository());
    final psController = Get.put(BannerRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                ///AppBar
                const THomeAppBar(),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///SearchBar
                const TSearchContainer(text: 'Search in Store'),
                const SizedBox(height: TSizes.spaceBtwSections),

                ///Categories
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      ///Heading
                      // TSectionHeading(
                      //   title: 'Popular Categories',
                      //   showActionButton: false,
                      //   textColor: Colors.white,
                      // ),
                      GestureDetector(
                        onTap: (){
                          print("object");
                          // cController.uploadDummyData(TDummyData.categories);
                          // psController.uploadDummyData(TDummyData.banners);
                          prController.uploadDummyData(TDummyData.products);
                        },
                        child: const TSectionHeading(title: 'Popular Categories',)
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      ///Categories
                      const THomeCategories()
                    ],
                  ),
                ),
                 const SizedBox(height: TSizes.spaceBtwSections,)
              ],
            )),

            ///Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Promo Slider
                  const TPromoSlider(
                    // banners: [
                    //   TImages.promoBanner7,
                    //   TImages.promoBanner5,
                    //   TImages.promoBanner6,
                    // ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Heading
                  TSectionHeading(title: 'Popular Products', onPressed: ()=> Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  ///Popular Products
                  Obx(
                    () {
                      if(controller.isLoading.value) return const TVerticalProductShimmer();

                      if(controller.featuredProducts.isEmpty) {
                        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                      }
                      return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                      );
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
