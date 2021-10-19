import 'package:flutter/material.dart';

class Coffee {
  const Coffee({
    required this.id,
    required this.coffeeIcon,
    required this.name,
    required this.price,
  });

  final IconData coffeeIcon;
  final String name;
  final int id;
  final int price;
}
