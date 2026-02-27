import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_detail/product_detail_cubit.dart';
import '../models/product.dart';
import '../widgets/product_detail/product_detail_header.dart';
import '../widgets/product_detail/product_details_section.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(),
      child: _ProductDetailView(product: product),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  final Product product;

  const _ProductDetailView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProductDetailHeader(product: product),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -20,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ProductDetailsSection(product: product),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
