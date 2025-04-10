import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.building_31),
                            labelText: 'Street',
                            labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.code),
                            labelText: 'Postal Code',
                            labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.building),
                            labelText: 'City',
                            labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                        ),
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.activity),
                            labelText: 'State',
                            labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.global),
                      labelText: 'Country',
                      labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: const Text('Save'),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
