import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/cart_model.dart';
import 'package:home_sweet_home/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class CartCard extends StatelessWidget {
  const CartCard(this.cart, {Key? key}) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      padding: EdgeInsets.only(
        top: 14,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      cart.product.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 165,
                height: 120,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 23,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.product.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: descriptionTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Rp. ${cart.product.price}',
                                style: priceTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: defaultMargin,
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        cartProvider.addQuantity(cart.id);
                                      },
                                      child: Image.asset(
                                        'assets/icon/plus.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      cart.quantity.toString().padLeft(
                                            2,
                                            '0',
                                          ),
                                      style: priceTextStyle.copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cartProvider.reduceQuantity(cart.id);
                                      },
                                      child: Image.asset(
                                        'assets/icon/minus.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 35,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartProvider.removeCart(cart.id);
                      },
                      child: Image.asset(
                        'assets/icon/cancel.png',
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Divider(
              thickness: 2,
              color: Color(0xffF0F0F0),
            ),
          ),
        ],
      ),
    );
  }
}
