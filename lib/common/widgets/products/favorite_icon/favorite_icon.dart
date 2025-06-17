import 'package:ecommerce_app/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favorites_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    // return Obx(
    //   () => TCircularIcon(
    //     icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
    //     color: controller.isFavorite(productId) ? TColors.error : null,
    //     // onPressed: () => controller.toggleFavoriteProduct(productId),
    //     // onPressed: () {
    //     //   print('hereeeeeee wish');
    //     // },
    //   ),
    // );

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.black.withOpacity(0.9)
              : TColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          icon: Icon(
            controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
            color: controller.isFavorite(productId) ? TColors.error : null,
          ),
          onPressed: () {
            controller.toggleFavoriteProduct(productId);
          },
        ),
      ),
    );

  }
}





