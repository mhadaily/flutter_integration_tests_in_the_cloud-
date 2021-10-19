import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/coffee.dart';
import '../const.dart';

class MenuList extends StatefulWidget {
  const MenuList({
    Key? key,
    required this.coffees,
  }) : super(key: key);

  final List<Coffee> coffees;

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<Coffee> _items = [];

  @override
  void initState() {
    super.initState();

    _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        return slideIt(context, index, animation);
      },
    );
  }

  Future<void> _loadItems() async {
    for (Coffee item in widget.coffees) {
      await Future.delayed(const Duration(milliseconds: 80));
      _items.add(item);
      listKey.currentState?.insertItem(_items.length - 1);
    }
  }

  Widget slideIt(BuildContext context, int index, animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceOut,
        ),
      ),
      child: GestureDetector(
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: Text(
            _items[index].name,
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            widget.coffees[index].name,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          leading: Icon(
            widget.coffees[index].coffeeIcon,
            size: 40,
            color: brown,
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        onTap: () {
          context.goNamed(
            'details',
            params: {'id': _items[index].id.toString()},
          );
        },
      ),
    );
  }
}
