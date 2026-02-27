import '../../models/product.dart';

const _noChange = Object();

class HomeState {
  final List<String> categories;
  final int selectedIndex;
  final List<Product> products;
  final bool isLoadingCategories;
  final bool isLoadingProducts;
  final String? errorMessage;

  const HomeState({
    required this.categories,
    required this.selectedIndex,
    required this.products,
    required this.isLoadingCategories,
    required this.isLoadingProducts,
    required this.errorMessage,
  });

  factory HomeState.initial() => const HomeState(
    categories: ['All'],
    selectedIndex: 0,
    products: [],
    isLoadingCategories: true,
    isLoadingProducts: true,
    errorMessage: null,
  );

  HomeState copyWith({
    List<String>? categories,
    int? selectedIndex,
    List<Product>? products,
    bool? isLoadingCategories,
    bool? isLoadingProducts,
    Object? errorMessage = _noChange,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      products: products ?? this.products,
      isLoadingCategories: isLoadingCategories ?? this.isLoadingCategories,
      isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
      errorMessage: identical(errorMessage, _noChange)
          ? this.errorMessage
          : errorMessage as String?,
    );
  }
}
