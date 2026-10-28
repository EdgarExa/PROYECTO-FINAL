import 'package:flutter/material.dart';
import '../../domain/models/product.dart';
import 'favorite_button.dart';
import 'price_label.dart';
import 'product_image.dart';
import 'rating_badge.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavorite,
    required this.onTap,
  });

  final Product product;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ProductImage(url: product.image, height: 138, width: double.infinity, borderRadius: 14),
                  Positioned(right: 4, top: 4, child: FavoriteButton(isFavorite: isFavorite, onPressed: onFavorite)),
                ],
              ),
              const SizedBox(height: 10),
              Text(product.category, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 3),
              Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              Row(
                children: [
                  Expanded(child: PriceLabel(price: product.price)),
                  RatingBadge(rating: product.rating),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
