import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/common/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,),
        itemBuilder: (_, __) {
          return const Column(
            children: [
              /// Image
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),

              /// Text
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
