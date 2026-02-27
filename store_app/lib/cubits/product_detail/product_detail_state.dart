class ProductDetailState {
  final int quantity;

  const ProductDetailState({required this.quantity});

  factory ProductDetailState.initial() => const ProductDetailState(quantity: 1);

  ProductDetailState copyWith({int? quantity}) {
    return ProductDetailState(quantity: quantity ?? this.quantity);
  }
}
