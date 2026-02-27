import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/product_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  Future<void> loadInitialData() async {
    emit(
      state.copyWith(
        isLoadingCategories: true,
        isLoadingProducts: true,
        errorMessage: null,
      ),
    );

    try {
      final categoriesFuture = ProductService.fetchCategories();
      final productsFuture = ProductService.fetchProducts();

      final categories = await categoriesFuture;
      final products = await productsFuture;

      emit(
        state.copyWith(
          categories: ['All', ...categories],
          selectedIndex: 0,
          products: products,
          isLoadingCategories: false,
          isLoadingProducts: false,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoadingCategories: false,
          isLoadingProducts: false,
          errorMessage: 'Error loading products',
        ),
      );
    }
  }

  Future<void> selectCategory(int index) async {
    if (index < 0 || index >= state.categories.length) {
      return;
    }

    emit(
      state.copyWith(
        selectedIndex: index,
        isLoadingProducts: true,
        errorMessage: null,
      ),
    );

    try {
      final products = index == 0
          ? await ProductService.fetchProducts()
          : await ProductService.fetchProductsByCategory(
              state.categories[index],
            );

      emit(
        state.copyWith(
          products: products,
          isLoadingProducts: false,
          errorMessage: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoadingProducts: false,
          errorMessage: 'Error loading products',
        ),
      );
    }
  }
}
