import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'bottom_actions.dart';
import 'product_info.dart';

class ProductDetailsSection extends StatelessWidget {
  final Product product;

  const ProductDetailsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ProductInfo(product: product),
              ),
            ),
            const SizedBox(height: 16),
            const SafeArea(top: false, child: BottomActions()),
          ],
        ),
      ),
    );
  }
}
