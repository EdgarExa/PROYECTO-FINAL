import 'package:flutter/material.dart';
import '../../domain/models/product.dart';
import 'product_card.dart';

class CatalogGrid extends StatelessWidget {
  const CatalogGrid({
    super.key,
    required this.products,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
  });

  final List<Product> products;
  final bool Function(Product) isFavorite;
  final ValueChanged<Product> onFavorite;
  final ValueChanged<Product> onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 260,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          isFavorite: isFavorite(product),
          onFavorite: () => onFavorite(product),
          onTap: () => onTap(product),
        );
      },
    );
  }
}
