import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

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
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => TValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: TValidator.validatePhoneNumber,
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
                        controller: controller.street,
                        validator: (value) => TValidator.validateEmptyText('Street', value),
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
                        controller: controller.postalCode,
                        validator: (value) => TValidator.validateEmptyText('Postal Code', value),
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
                        controller: controller.city,
                        validator: (value) => TValidator.validateEmptyText('City', value),
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
                        controller: controller.state,
                        validator: (value) => TValidator.validateEmptyText('State', value),
                        expands: false,
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
                  controller: controller.country,
                  validator: (value) => TValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.global),
                      labelText: 'Country',
                      labelStyle: TextStyle(color: dark ? TColors.light : TColors.dark)
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                    await controller.addNewAddress();
                    },
                    child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
