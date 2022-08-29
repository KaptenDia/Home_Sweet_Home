import 'package:home_sweet_home/pages/favorites_page.dart';

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
                    product.price,
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
                onPressed: () {},
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
