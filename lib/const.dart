import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/coffee.dart';

Color darkBrown = const Color(0xFFA26E47);
Color lightBrown = const Color(0xFFF9E8D4);
Color brown = Colors.brown;
Color facebookColor = const Color(0xFF4867AA);

final List<Coffee> coffees = [
  const Coffee(
    id: 1001,
    coffeeIcon: FontAwesomeIcons.coffee,
    name: "Espresso ",
    price: 8,
  ),
  const Coffee(
    id: 1002,
    coffeeIcon: FontAwesomeIcons.mugHot,
    name: "Cappuccino",
    price: 10,
  ),
  const Coffee(
    id: 1003,
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "Mocha",
    price: 12,
  ),
  const Coffee(
    id: 1004,
    coffeeIcon: FontAwesomeIcons.beer,
    name: "Americano",
    price: 7,
  ),
  const Coffee(
    id: 1005,
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "Italian Macchiato",
    price: 5,
  ),
  const Coffee(
    id: 1006,
    coffeeIcon: FontAwesomeIcons.coffee,
    name: "Flat White",
    price: 3,
  ),
  const Coffee(
    id: 1007,
    coffeeIcon: FontAwesomeIcons.mugHot,
    name: "American Affogato",
    price: 11,
  ),
  const Coffee(
    id: 1008,
    coffeeIcon: FontAwesomeIcons.coffee,
    name: "Long Black",
    price: 4,
  ),
  const Coffee(
    id: 1015,
    coffeeIcon: FontAwesomeIcons.mugHot,
    name: "Latte",
    price: 12,
  ),
  const Coffee(
    id: 1009,
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "American Espresso",
    price: 9,
  ),
  const Coffee(
      id: 10010,
      coffeeIcon: FontAwesomeIcons.beer,
      name: "CAFÈ AU LAIT.",
      price: 10),
  const Coffee(
      id: 10011,
      coffeeIcon: FontAwesomeIcons.coffee,
      name: "AFFÈ MOCHA.",
      price: 12),
  const Coffee(
    id: 10012,
    coffeeIcon: FontAwesomeIcons.beer,
    name: "Americano",
    price: 7,
  ),
  const Coffee(
    id: 10013,
    coffeeIcon: FontAwesomeIcons.cocktail,
    name: "Double Exspersso",
    price: 5,
  ),
];
