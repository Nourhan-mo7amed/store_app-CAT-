import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailState.initial());

  void incrementQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decrementQuantity() {
    if (state.quantity <= 1) {
      return;
    }
    emit(state.copyWith(quantity: state.quantity - 1));
  }
}
