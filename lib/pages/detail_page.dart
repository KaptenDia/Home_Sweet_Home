import 'package:flutter/material.dart';
import 'package:home_sweet_home/providers/cart_provider.dart';
import 'package:home_sweet_home/providers/favorite_provider.dart';
import 'package:home_sweet_home/theme.dart';
import 'package:home_sweet_home/widgets/selected_color.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../widgets/cart_counter.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int numOfItems = 1;
  Widget detailImage(BuildContext context) {
    int isSelected = 0;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 455,
            child: Container(
              margin: const EdgeInsets.only(
                left: 52,
              ),
              width: 323,
              height: 455,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    50,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    widget.product.detailImage,
                  ),
                  alignment: Alignment.centerRight,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 19,
                      left: 22,
                    ),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/icon/back.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 56,
                  left: 20,
                ),
                height: 192,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    SelectedColor(
                      color: whiteColor,
                      isSelected: true,
                    ),
                    SelectedColor(
                      color: Color(0xffB4916C),
                    ),
                    SelectedColor(
                      color: Color(0xffE4CBAD),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget detailProduct() {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.title,
            style: titleTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
              color: blueColor,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                'Rp. ${widget.product.price}',
                style: priceTextStyle.copyWith(
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25,
                ),
                child: Container(
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
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 17),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon/star 1.png',
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 21,
                  ),
                  child: Text(
                    widget.product.rating.toString(),
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  '(${widget.product.review} Reviews)',
                  style: descriptionTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 13,
            ),
            width: 325,
            height: 125,
            child: Text(
              widget.product.description,
              style: descriptionTextStyle.copyWith(
                fontWeight: light,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Widget button() {
      return Container(
        width: 325,
        height: 60,
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                favoriteProvider.setProduct(widget.product);

                if (favoriteProvider.isFavorite(widget.product)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Has been added to the favorite',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Has been removed from the favorite',
                        textAlign: TextAlign.center,
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  color: Color(0xffF0F0F0),
                  image: DecorationImage(
                    image: AssetImage(
                      favoriteProvider.isFavorite(widget.product)
                          ? 'assets/icon/favorite1.png'
                          : 'assets/icon/marker 2.png',
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                ),
                height: 60,
                width: 250,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    cartProvider.addCart(widget.product);
                  },
                  child: Text(
                    'Add to cart',
                    style: buttonTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          detailImage(context),
          SizedBox(
            height: 25,
          ),
          detailProduct(),
          SizedBox(
            height: 19,
          ),
          button(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
