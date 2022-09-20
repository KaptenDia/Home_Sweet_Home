import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/cart_model.dart';
import 'package:home_sweet_home/models/product_model.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../theme.dart';

class CartCounter extends StatefulWidget {
  const CartCounter(this.cart, {Key? key}) : super(key: key);
  final CartModel cart;

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
