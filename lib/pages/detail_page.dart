import 'package:flutter/material.dart';
import 'package:home_sweet_home/theme.dart';

import '../models/product_model.dart';
import '../widgets/cart_counter.dart';
import '../widgets/color_dot.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  Widget detailImage(BuildContext context) {
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
                    product.detailImage,
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
                    ColorDot(
                      color: whiteColor,
                      isSelected: true,
                    ),
                    ColorDot(
                      color: Color(0xffB4916C),
                    ),
                    ColorDot(
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
            product.title,
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
                product.price,
                style: priceTextStyle.copyWith(
                  fontSize: 30,
                ),
              ),
              CartCounter(),
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
                    '4.5',
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  '(${product.review} Reviews)',
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
              product.description,
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

  Widget button() {
    return Container(
      width: 325,
      height: 60,
      margin: EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              color: Color(0xffF0F0F0),
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon/marker 2.png',
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
                onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
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
