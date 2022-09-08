import 'package:home_sweet_home/pages/cart_page.dart';
import 'package:home_sweet_home/pages/favorites_page.dart';
import 'package:home_sweet_home/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../theme.dart';
import 'Package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ProductCard({Key? key, required this.product, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            height: 250,
            width: 157,
            child: Container(
              padding: const EdgeInsets.only(
                top: 210,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: descriptionTextStyle1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Rp. ${product.price}',
                    style: priceTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            height: 200,
            width: 157,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  product.image,
                ),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                left: 117,
                top: 160,
              ),
              child: IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Are You Sure To Add This Item Into The Cart ?',
                      style: priceTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          cartProvider.addCart(product);
                          Navigator.popAndPushNamed(
                            context,
                            'CartPage',
                          );
                        },
                        child: Text(
                          'Yes',
                          style: subtitleTextStyle,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'No',
                          style: subtitleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                icon: Image.asset(
                  'assets/icon/bag.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
