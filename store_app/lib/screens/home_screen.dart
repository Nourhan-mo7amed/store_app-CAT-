import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home/home_cubit.dart';
import '../widgets/home/home_categories_section.dart';
import '../widgets/home/home_header_section.dart';
import '../widgets/home/home_products_section.dart';
import '../widgets/home/home_search_section.dart';
import 'product_detail_screen.dart';
import '../core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..loadInitialData(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.location_on, color: AppColors.primary),
            const Text(
              " Mansoura",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const HomeHeaderSection(),
          const HomeSearchSection(),
          const HomeCategoriesSection(),
          const SizedBox(height: 16),
          Expanded(
            child: HomeProductsSection(
              onProductTap: (product) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
