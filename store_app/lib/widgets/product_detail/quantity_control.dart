import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/product_detail/product_detail_cubit.dart';

class QuantityControl extends StatelessWidget {
  final int quantity;

  const QuantityControl({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: context.read<ProductDetailCubit>().decrementQuantity,
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: context.read<ProductDetailCubit>().incrementQuantity,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
