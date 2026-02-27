import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com/products';

  static Future<List<Product>> fetchProducts({int limit = 30}) async {
    final response = await http.get(Uri.parse('$_baseUrl?limit=$limit'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List productsJson = data['products'];
      return productsJson.map((p) => Product.fromJson(p)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/category-list'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Failed to load categories: ${response.statusCode}');
    }
  }

  static Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/category/$category'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List productsJson = data['products'];
      return productsJson.map((p) => Product.fromJson(p)).toList();
    } else {
      throw Exception(
        'Failed to load products for category $category: ${response.statusCode}',
      );
    }
  }
}
