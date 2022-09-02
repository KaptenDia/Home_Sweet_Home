import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/cart_model.dart';

import '../theme.dart';

class CartCounter extends StatefulWidget {
  CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    final CartModel cart;
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                numOfItems++;
              });
            },
            icon: Image.asset(
              'assets/icon/plus.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              numOfItems.toString().padLeft(
                    2,
                    '0',
                  ),
              style: priceTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            },
            icon: Image.asset(
              'assets/icon/minus.png',
            ),
          ),
        ],
      ),
    );
  }
}
