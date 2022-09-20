import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/product_model.dart';
import 'package:home_sweet_home/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../theme.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
                      product.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 125,
                height: 100,
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
                                product.title,
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
                                'Rp. ${product.price}',
                                style: priceTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
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
                  left: 65,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        favoriteProvider.setProduct(product);
                      },
                      child: Image.asset(
                        'assets/icon/cancel.png',
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        cartProvider.addCart(product);
                        favoriteProvider.setProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Yay! The items has been added to cart!',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/icon/bag2.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
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
