import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        //'Coding with T',
        controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        //'support@codingwithT.com',
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white,),
      ),
    );
  }
}