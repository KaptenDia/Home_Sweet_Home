import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/product_model.dart';

import '../theme.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Column(
            children: [
              Text(
                'Favorites',
                style: subtitleTextStyle1.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Image.asset(
            'assets/icon/search.png',
            color: blackColor,
            width: 20,
            height: 20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16,
            ),
            child: Image.asset(
              'assets/icon/cart.png',
              color: blackColor,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      width: 335,
      height: 113,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: EdgeInsets.only(
        top: 14,
      ),
      child: Row(
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
                  'assets/images/image3.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              children: [
                Text('Coffe'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        header(),
        content(),
      ],
    );
  }
}
