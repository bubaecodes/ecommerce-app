import 'package:ecommerce_app/features/shop/models/banner_model.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/models/product_variation_model.dart';
import 'package:ecommerce_app/routes/routes.dart';

import '../constants/image_strings.dart';

class TDummyData {
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.promoBanner1, targetScreen: TRoutes.order, active:false),
    BannerModel(imageUrl: TImages.promoBanner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.promoBanner3, targetScreen: TRoutes.favorites, active: true),
    BannerModel(imageUrl: TImages.promoBanner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.promoBanner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.promoBanner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.promoBanner7, targetScreen: TRoutes.checkout, active: false),
    //BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active:false),
  ];

  /// User
  // static final UserModel user = UserModel(
  //   firstName: 'Coding',
  //   lastName: 'with Bubae',
  //   email: 'bubaetina@gmail.com',
  //   phoneNumber: '+23423456789',
  //   profilePicture: TImages.user,
  //   addresses: [
  //     AddressModel(
  //       id: '1',
  //       name: 'Bubae',
  //       phoneNumber: '+23423456789',
  //       street: '405677 GRA',
  //       city: 'Enugu',
  //       state: 'Enugu',
  //       postalCode: '56222',
  //       country: 'Nigeria'
  //     ),
  //     AddressModel(
  //       id: '1',
  //       name: 'Bubae',
  //       phoneNumber: '+23423456789',
  //       street: '405677 GRA',
  //       city: 'Enugu',
  //       state: 'Enugu',
  //       postalCode: '56222',
  //       country: 'Nigeria'
  //     ),
  //   ]
  // );

  /// Cart
  // static final CartModel user = CartModel(
  //     cardId: '001',
  //     addresses: [
  //       CartItemModel(
  //         productId: '001',
  //         variationId: '1',
  //         quantity: 1,
  //         title: products[0].title,
  //         image: products[0].thumbnail,
  //         brandName: products[0].brand!.name,
  //         price: products[0].productVariations![0].price,
  //         selectedVariation: products[0].productVariations![0].attributedValues,
  //       ),
  //       CartItemModel(
  //         productId: '002',
  //         variationId: '',
  //         quantity: 1,
  //         title: products[0].title,
  //         image: products[0].thumbnail,
  //         brandName: products[0].brand!.name,
  //         price: products[0].productVariations![0].price,
  //         selectedVariation: products[0].productVariations![0].attributedValues,
  //       ),
  //     ]
  // );
  //
  // /// Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'BBB0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09, 9),
  //   ),
  //   OrderModel(
  //     id: 'BBB0022',
  //     status: OrderStatus.shipped,
  //     items: cart.items,
  //     totalAmount: 369,
  //     orderDate: DateTime(2023, 10, 2),
  //     deliveryDate: DateTime(2023, 11, 9),
  //   ),
  // ];


  /// List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),

    /// SubCategories
    CategoryModel(id: '8', name: 'Sports Shoes', image: TImages.sportIcon, parentId: '1', isFeatured: false),
    CategoryModel(id: '9', name: 'Track suits', image: TImages.sportIcon, parentId: '1', isFeatured: false),
    CategoryModel(id: '10', name: 'Sports Equipments', image: TImages.sportIcon, parentId: '1', isFeatured: false),

    /// Furniture
    CategoryModel(id: '11', name: 'Bedroom Furniture', image: TImages.furnitureIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '12', name: 'Kitchen Furniture', image: TImages.furnitureIcon, parentId: '5', isFeatured: false),
    CategoryModel(id: '13', name: 'Office Furniture', image: TImages.furnitureIcon, parentId: '5', isFeatured: false),

    /// Electronics
    CategoryModel(id: '14', name: 'Laptop', image: TImages.electronicsIcon, parentId: '2', isFeatured: false),
    CategoryModel(id: '15', name: 'Mobile', image: TImages.electronicsIcon, parentId: '2', isFeatured: false),

    /// Clothes
    CategoryModel(id: '16', name: 'Shirts', image: TImages.clothIcon, parentId: '3', isFeatured: false),
  ];

  /// List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '1', image: TImages.adidasLogo, name: 'Nike', productsCount: 95, isFeatured: true),
    BrandModel(id: '1', image: TImages.kenwoodLogo, name: 'Nike', productsCount: 36, isFeatured: false),
    BrandModel(id: '1', image: TImages.ikeaLogo, name: 'Nike', productsCount: 36, isFeatured: false),
    BrandModel(id: '1', image: TImages.appleLogo, name: 'Nike', productsCount: 16, isFeatured: true),
    BrandModel(id: '1', image: TImages.acerLogo, name: 'Nike', productsCount: 36, isFeatured: false),
    BrandModel(id: '1', image: TImages.jordanLogo, name: 'Nike', productsCount: 36, isFeatured: true),
    BrandModel(id: '1', image: TImages.pumaLogo, name: 'Nike', productsCount: 65, isFeatured: true),
    BrandModel(id: '1', image: TImages.zaraLogo, name: 'Nike', productsCount: 36, isFeatured: true),
    BrandModel(id: '1', image: TImages.samsungLogo, name: 'Nike', productsCount: 36, isFeatured: false),
    //BrandModel(id: '1', image: TImages.electronicsIcon, name: 'Nike', productsCount: 36, isFeatured: false),
  ];

  /// List of all brand categories
  // static final List<BrandCategoryModel> brandCategory = [
  //   BrandCategoryModel(brandId: '1', categoryId: '1'),
  //   BrandCategoryModel(brandId: '1', categoryId: '8'),
  //   BrandCategoryModel(brandId: '1', categoryId: '9'),
  //   BrandCategoryModel(brandId: '1', categoryId: '10'),
  //   BrandCategoryModel(brandId: '2', categoryId: '1'),
  //   BrandCategoryModel(brandId: '2', categoryId: '8'),
  //   BrandCategoryModel(brandId: '2', categoryId: '9'),
  //   BrandCategoryModel(brandId: '2', categoryId: '10'),
  //   BrandCategoryModel(brandId: '3', categoryId: '1'),
  //   BrandCategoryModel(brandId: '3', categoryId: '8'),
  //   BrandCategoryModel(brandId: '3', categoryId: '9'),
  //   BrandCategoryModel(brandId: '3', categoryId: '10'),
  //   BrandCategoryModel(brandId: '4', categoryId: '1'),
  //   BrandCategoryModel(brandId: '4', categoryId: '8'),
  //   BrandCategoryModel(brandId: '4', categoryId: '9'),
  //   BrandCategoryModel(brandId: '4', categoryId: '10'),
  //   BrandCategoryModel(brandId: '5', categoryId: '15'),
  //   BrandCategoryModel(brandId: '5', categoryId: '2'),
  //   BrandCategoryModel(brandId: '10', categoryId: '2'),
  //   BrandCategoryModel(brandId: '10', categoryId: '14'),
  //   BrandCategoryModel(brandId: '6', categoryId: '3'),
  //   BrandCategoryModel(brandId: '6', categoryId: '16'),
  //   BrandCategoryModel(brandId: '7', categoryId: '2'),
  //   BrandCategoryModel(brandId: '8', categoryId: '5'),
  //   BrandCategoryModel(brandId: '8', categoryId: '11'),
  //   BrandCategoryModel(brandId: '8', categoryId: '12'),
  //   BrandCategoryModel(brandId: '8', categoryId: '13'),
  //   BrandCategoryModel(brandId: '9', categoryId: '5'),
  //   BrandCategoryModel(brandId: '9', categoryId: '11'),
  //   BrandCategoryModel(brandId: '9', categoryId: '12'),
  //   BrandCategoryModel(brandId: '9', categoryId: '13'),
  // ];

  /// List of all Product Categories
  // static final List<ProductCategoryModel> productCategories = [
  //   ProductCategoryModel(productId: '001', categoryId: '1'),
  //   ProductCategoryModel(productId: '001', categoryId: '8'),
  //   ProductCategoryModel(productId: '004', categoryId: '3'),
  //   ProductCategoryModel(productId: '002', categoryId: '3'),
  //   ProductCategoryModel(productId: '002', categoryId: '16'),
  //   ProductCategoryModel(productId: '003', categoryId: '3'),
  //   ProductCategoryModel(productId: '005', categoryId: '1'),
  //   ProductCategoryModel(productId: '005', categoryId: '8'),
  //   ProductCategoryModel(productId: '040', categoryId: '2'),
  //   ProductCategoryModel(productId: '040', categoryId: '15'),
  //   ProductCategoryModel(productId: '006', categoryId: '2'),
  //   ProductCategoryModel(productId: '007', categoryId: '4'),
  //   ProductCategoryModel(productId: '009', categoryId: '8'),
  //   ProductCategoryModel(productId: '009', categoryId: '1'),
  //   ProductCategoryModel(productId: '010', categoryId: '1'),
  //   ProductCategoryModel(productId: '010', categoryId: '8'),
  //   ProductCategoryModel(productId: '011', categoryId: '1'),
  //   ProductCategoryModel(productId: '011', categoryId: '8'),
  //   ProductCategoryModel(productId: '012', categoryId: '1'),
  //   ProductCategoryModel(productId: '012', categoryId: '8'),
  //   ProductCategoryModel(productId: '013', categoryId: '1'),
  //   ProductCategoryModel(productId: '013', categoryId: '8'),
  //
  //   ProductCategoryModel(productId: '014', categoryId: '1'),
  //   ProductCategoryModel(productId: '014', categoryId: '9'),
  //   ProductCategoryModel(productId: '015', categoryId: '1'),
  //   ProductCategoryModel(productId: '015', categoryId: '9'),
  //   ProductCategoryModel(productId: '016', categoryId: '1'),
  //   ProductCategoryModel(productId: '016', categoryId: '9'),
  //   ProductCategoryModel(productId: '017', categoryId: '1'),
  //   ProductCategoryModel(productId: '017', categoryId: '9'),
  //
  //   ProductCategoryModel(productId: '018', categoryId: '1'),
  //   ProductCategoryModel(productId: '018', categoryId: '10'),
  //   ProductCategoryModel(productId: '019', categoryId: '1'),
  //   ProductCategoryModel(productId: '019', categoryId: '10'),
  //   ProductCategoryModel(productId: '020', categoryId: '1'),
  //   ProductCategoryModel(productId: '020', categoryId: '10'),
  //   ProductCategoryModel(productId: '021', categoryId: '1'),
  //   ProductCategoryModel(productId: '021', categoryId: '10'),
  //
  //   ProductCategoryModel(productId: '022', categoryId: '5'),
  //   ProductCategoryModel(productId: '022', categoryId: '11'),
  //   ProductCategoryModel(productId: '023', categoryId: '5'),
  //   ProductCategoryModel(productId: '023', categoryId: '11'),
  //   ProductCategoryModel(productId: '024', categoryId: '5'),
  //   ProductCategoryModel(productId: '024', categoryId: '11'),
  //   ProductCategoryModel(productId: '025', categoryId: '5'),
  //   ProductCategoryModel(productId: '025', categoryId: '11'),
  //
  //   ProductCategoryModel(productId: '026', categoryId: '5'),
  //   ProductCategoryModel(productId: '026', categoryId: '12'),
  //   ProductCategoryModel(productId: '027', categoryId: '5'),
  //   ProductCategoryModel(productId: '027', categoryId: '12'),
  //   ProductCategoryModel(productId: '028', categoryId: '5'),
  //   ProductCategoryModel(productId: '028', categoryId: '12'),
  //
  //   ProductCategoryModel(productId: '029', categoryId: '5'),
  //   ProductCategoryModel(productId: '029', categoryId: '13'),
  //   ProductCategoryModel(productId: '030', categoryId: '5'),
  //   ProductCategoryModel(productId: '030', categoryId: '13'),
  //   ProductCategoryModel(productId: '031', categoryId: '5'),
  //   ProductCategoryModel(productId: '031', categoryId: '13'),
  //   ProductCategoryModel(productId: '032', categoryId: '5'),
  //   ProductCategoryModel(productId: '032', categoryId: '13'),
  //
  //   ProductCategoryModel(productId: '033', categoryId: '2'),
  //   ProductCategoryModel(productId: '033', categoryId: '14'),
  //   ProductCategoryModel(productId: '034', categoryId: '2'),
  //   ProductCategoryModel(productId: '034', categoryId: '14'),
  //   ProductCategoryModel(productId: '035', categoryId: '2'),
  //   ProductCategoryModel(productId: '035', categoryId: '14'),
  //   ProductCategoryModel(productId: '036', categoryId: '2'),
  //   ProductCategoryModel(productId: '036', categoryId: '14'),
  //
  //   ProductCategoryModel(productId: '037', categoryId: '2'),
  //   ProductCategoryModel(productId: '037', categoryId: '15'),
  //   ProductCategoryModel(productId: '038', categoryId: '2'),
  //   ProductCategoryModel(productId: '038', categoryId: '15'),
  //   ProductCategoryModel(productId: '039', categoryId: '2'),
  //   ProductCategoryModel(productId: '039', categoryId: '15'),
  //   // Product 040 is after product 005
  //
  //   ProductCategoryModel(productId: '008', categoryId: '2'),
  // ];

  /// List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike Sports Shoe',
      // id: '1',
      // stock: 34,
      // price: 134,
      // salePrice: 122.6,
      // image: TImages.productImage1,
      // description: 'This is a Product description for Green Nike Sports Shoe.',
      // attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This is a Product description for Green Nike Sports Shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '2', stock: 15, price: 132, image: TImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '3', stock: 8, price: 234, image: TImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '4', stock: 222, price: 232, image: TImages.productImage1, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '5', stock: 8, price: 334, image: TImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '6', stock: 11, price: 332, image: TImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}
        ),
      ],
      productType: 'ProductType.variable',
    ),
    // Product Model
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage48,
      description: 'This is a Product description for Blue Nike Sleeveless vest. There are more things that can be added but lorem ipsum the remaining.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [TImages.productImage49, TImages.productImage22, TImages.productImage49],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: TImages.productImage33,
      description: 'This is a Product description for Blue Nike Sleeveless vest. There are more things that can be added but lorem ipsum the remaining.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [TImages.productImage19, TImages.productImage32, TImages.productImage47],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage21,
      description: 'This is a Product description for Blue Nike Sleeveless vest. There are more things that can be added but lorem ipsum the remaining.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [TImages.productImage40, TImages.productImage2, TImages.productImage44],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage10,
          description: 'This is a Product description for 4 Color collar t-shirt dry fit',
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '2', stock: 15, price: 132, image: TImages.productImage1, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '3', stock: 0, price: 234, image: TImages.productImage13, attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '4', stock: 222, price: 232, image: TImages.productImage13, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '5', stock: 0, price: 334, image: TImages.productImage31, attributeValues: {'Color': 'Green', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '6', stock: 11, price: 332, image: TImages.productImage11, attributeValues: {'Color': 'Green', 'Size': 'EU 30'}
        ),
        ProductVariationModel(
          id: '7', stock: 0, price: 334, image: TImages.productImage27, attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}
        ),
        ProductVariationModel(
          id: '8', stock: 11, price: 332, image: TImages.productImage30, attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}
        ),
      ],
      productType: 'ProductType.variable',
    ),

    /// Products after banner
    ProductModel(
      id: '005',
      title: 'Nike Air Jordan Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage27,
      description: 'Nike Air Jordan Shoes for running. Quality product, long lasting.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [TImages.productImage4, TImages.productImage22, TImages.productImage14],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 16,
          price: 36,
          salePrice: 12.6,
          image: TImages.productImage18,
          description: "Flutter is Google's mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified bla bla.",
          attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '2', stock: 15, price: 35, image: TImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '3', stock: 14, price: 34, image: TImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '4', stock: 13, price: 33, image: TImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '5', stock: 12, price: 32, image: TImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '6', stock: 11, price: 31, image: TImages.productImage8, attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      description: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery Tinting.',
      brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Samsung'),
      images: [TImages.productImage14, TImages.productImage12, TImages.productImage13, TImages.productImage10],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      description: 'This is a product description for TOMI Dog food. There are more things that can be added but I am just practicing and nothing else.',
      brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Tomi'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    /// 008 after 040
    ProductModel(
      id: '009',
      title: 'Nike Air Jordan 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: false,
      thumbnail: TImages.productImage19,
      description: 'This is a product description for Nike Air Jordan. There are more things that can be added but I am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [TImages.productImage19, TImages.productImage20, TImages.productImage21, TImages.productImage22],
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

  ];
}











