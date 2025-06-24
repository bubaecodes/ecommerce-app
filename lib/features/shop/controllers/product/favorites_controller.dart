import 'dart:convert';

import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/local_storage/storage_utility.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  /// variables
  //final favorites = <String, bool>{}.obs;
  final RxMap<String, bool> favorites = <String, bool>{}.obs;



  //final refreshTrigger = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // method to initialize favorites by reading from storage
  void initFavorites() {
    final json = TLocalStorage.instance().readData('favorites');

    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist');
    } else {
      //TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      TLoaders.customToast(message: 'Product has been removed to the Wishlist');
    }
  }

  // void toggleFavoriteProduct(String productId) {
  //   if (!favorites.containsKey(productId)) {
  //     favorites[productId] = true;
  //     TLoaders.customToast(message: 'Product has been added to the Wishlist');
  //   } else {
  //     favorites.remove(productId);
  //     TLoaders.customToast(message: 'Product has been removed from the Wishlist');
  //   }
  //   saveFavoritesToStorage();
  // }


  // void toggleFavoriteProduct(String productId) {
  //   if (!favorites.containsKey(productId)) {
  //     favorites[productId] = true;
  //     TLoaders.customToast(message: 'Product has been added to the Wishlist');
  //   } else {
  //     favorites.remove(productId);
  //     TLoaders.customToast(message: 'Product has been removed from the Wishlist');
  //   }
  //   saveFavoritesToStorage();
  //   refreshTrigger.value++; // Notify UI to reload
  // }



  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites); //possible error for the selected wishlist not showing
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavoriteProducts(favorites.keys.toList());
  }

}











