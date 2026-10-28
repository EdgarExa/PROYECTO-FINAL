import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.isFavorite, required this.onPressed});

  final bool isFavorite;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      tooltip: isFavorite ? 'Quitar de favoritos' : 'Agregar a favoritos',
      onPressed: onPressed,
      icon: Icon(isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded),
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFFEAF0F4),
        foregroundColor: isFavorite ? const Color(0xFFB65362) : const Color(0xFF496A81),
      ),
    );
  }
}
