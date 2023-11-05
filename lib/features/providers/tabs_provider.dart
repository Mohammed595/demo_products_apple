import 'package:demo_products_apple/common/Models/category_model.dart';
import 'package:demo_products_apple/common/Models/product_model.dart';
import 'package:demo_products_apple/common/constans/icons.dart';
import 'package:demo_products_apple/common/constans/images.dart';
import 'package:riverpod/riverpod.dart';

enum CategoryType { mac, iphone, ipad, watch, airpods }

class TapsNotifier extends StateNotifier<int> {
  TapsNotifier() : super(0);

  void selectNewIndext(int ind) {
    state = ind;
  }
}

final tabsProvider =
    StateNotifierProvider<TapsNotifier, int>((ref) => TapsNotifier());

// categoyes ============
class CategorirsNotifier extends StateNotifier<List<CategoryModel>> {
  CategorirsNotifier() : super([]) {
    addCategories();
  }

  List<CategoryModel> _catList = [
    CategoryModel('Mac', IconsApp.macCategory, CategoryType.mac),
    CategoryModel('iphone', IconsApp.phoneCategory, CategoryType.iphone),
    CategoryModel('airpods', IconsApp.airpodsCategory, CategoryType.airpods),
    CategoryModel('watch', IconsApp.watchCategory, CategoryType.watch),
    CategoryModel('ipad', IconsApp.ipadCategory, CategoryType.ipad),
  ];

  void addCategories() {
    state = [...state, ..._catList];
  }
}

final categoryProvider =
    StateNotifierProvider<CategorirsNotifier, List<CategoryModel>>(
        (ref) => CategorirsNotifier());

// prodects ==============
class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super([]) {
    addProducts();
  }

  List<ProductModel> _products = [
    ProductModel('moacbook Air m1', 'mac', ImagesApp.macImage1),
    ProductModel('moacbook Air m2', 'mac', ImagesApp.macImage2),
    ProductModel('iphone', 'iphone', ImagesApp.macImage3),
  ];

  void addProducts() {
    state = [...state, ..._products];
  }
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<ProductModel>>(
  (ref) {
    return ProductNotifier();
  },
);

/////////    fillters   /////

class FillterNotifer extends StateNotifier<Map<String, List<ProductModel>>> {
  FillterNotifer(this.ref) : super({});

  final Ref ref;

  void filterProducts(CategoryType categoryType) {
    final categories = ref.read(categoryProvider);
    final products = ref.read(productProvider);

    final selectedCtegory = categories.firstWhere(
        (element) => element.categoryType.toString() == categoryType.toString(),
        orElse: null);

    if (selectedCtegory != null) {
      final fillterProducts = products
          .where(
            (element) =>
                element.type == selectedCtegory.categoryType.toString(),
          )
          .toList();

      state = {selectedCtegory.categoryType.toString(): fillterProducts};
    }
  }
}

final fillterProvider =
    StateNotifierProvider<FillterNotifer, Map<String, List<ProductModel>>>(
  (ref) => FillterNotifer(ref),
);
