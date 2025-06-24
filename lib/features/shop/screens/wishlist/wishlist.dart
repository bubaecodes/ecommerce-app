import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:ecommerce_app/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce_app/features/shop/controllers/product/favorites_controller.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController();
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),

      /// body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          // child: Column(
          //   children: [
          //     TGridLayout(
          //       itemCount: 6,
          //       itemBuilder: (_, index) => TProductCardVertical(product: ProductModel.empty()),
          //     ),
          //   ],
          // ),

          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                /// nothing found widget
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: TImages.emptyAnimation,
                  showAction: true,
                  actionText: 'Lets\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );

                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if(widget != null) return widget;

                final products = snapshot.data!;
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                );
              }
            ),
          ),


          // child: Obx(
          //   () {
          //     controller.refreshTrigger.value; // This makes Obx reactive
          //     return FutureBuilder(
          //       future: controller.favoriteProducts(),
          //       builder: (context, snapshot) {
          //         final emptyWidget = TAnimationLoaderWidget(
          //             text: 'Whoops! Wishlist is Empty...',
          //             animation: TImages.emptyAnimation,
          //             showAction: true,
          //             actionText: 'Let\'s add some',
          //             onActionPressed: () => Get.off(() => const NavigationMenu()),
          //         );
          //
          //         const loader = TVerticalProductShimmer(itemCount: 6);
          //         final widget = TCloudHelperFunctions.checkMultiRecordState(
          //         snapshot: snapshot,
          //         loader: loader,
          //         nothingFound: emptyWidget,
          //         );
          //         if (widget != null) return widget;
          //
          //         final products = snapshot.data!;
          //         return TGridLayout(
          //         itemCount: products.length,
          //         itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
          //         );
          //         },
          //     );
          //   }
          // ),

        ),
      ),
    );
  }
}




