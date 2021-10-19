import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/coffee.dart';
import '../const.dart';

class MenuDetails extends StatefulWidget {
  const MenuDetails({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  _MenuDetailsState createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Preferences"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: lightBrown,
              child: Icon(
                widget.coffee.coffeeIcon,
                size: 120,
                color: brown,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.coffee.name,
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 20,
                              color: Colors.brown.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "USD ${widget.coffee.price}",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "1",
                            style: TextStyle(
                              color: Colors.brown.shade800,
                              fontSize: 26,
                            ),
                          ),
                          const SizedBox(width: 20),
                          OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0),
                              ),
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder()),
                              side: MaterialStateProperty.all(
                                BorderSide(color: Colors.grey.shade600),
                              ),
                            ),
                            onPressed: () async {
                              // throw new StateError('This is a Dart exception.');
                              foo() async {
                                throw const FormatException(
                                  'This is an async Dart exception.',
                                );
                              }

                              await foo();
                            },
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 7),
                          OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0),
                              ),
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder()),
                              side: MaterialStateProperty.all(
                                BorderSide(color: Colors.grey.shade600),
                              ),
                            ),
                            onPressed: () {},
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 3),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(
                        "Size",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(widget.coffee.coffeeIcon,
                              color: Colors.grey.shade400),
                          const SizedBox(width: 50),
                          Icon(
                            widget.coffee.coffeeIcon,
                            color: Colors.brown.shade800,
                            size: 30,
                          ),
                          const SizedBox(width: 50),
                          Icon(
                            widget.coffee.coffeeIcon,
                            color: Colors.grey.shade400,
                            size: 36,
                          ),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 3),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(
                        "Sugar",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 50),
                          Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 50),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.brown.shade800,
                              ),
                              Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.brown.shade800,
                              ),
                            ],
                          ),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 3),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Text(
                        "Additions",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.cake,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 50),
                          Icon(
                            FontAwesomeIcons.iceCream,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 65),
                          const Icon(Icons.cloud, color: Colors.white),
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 3),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Total:",
                        style: TextStyle(fontSize: 28),
                      ),
                      Text(
                        "USD ${widget.coffee.price}",
                        style: TextStyle(
                          color: Colors.brown.shade800,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(55, 15, 55, 15),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(darkBrown),
                          ),
                          onPressed: () {
                            exit(0); // force app to close
                            // throw Exception('this is dart crash');
                          },
                          child: const Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
