import 'dart:convert';
import 'package:flutter/services.dart';

class LocalJsonService {
  Future<List<Map<String, dynamic>>> readProducts() async {
    final raw = await rootBundle.loadString('assets/data/products.json');
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic> || decoded['products'] is! List) {
      throw const FormatException('El JSON debe contener una lista "products".');
    }
    return (decoded['products'] as List).map((item) {
      if (item is! Map<String, dynamic>) {
        throw const FormatException('Cada producto debe ser un objeto JSON.');
      }
      return item;
    }).toList();
  }
}
