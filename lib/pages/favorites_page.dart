import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/product_model.dart';
import 'package:home_sweet_home/pages/cart_page.dart';
import 'package:home_sweet_home/providers/cart_provider.dart';
import 'package:home_sweet_home/providers/favorite_provider.dart';
import 'package:home_sweet_home/widgets/favorite_card.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import 'detail_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteProvider favoriteProvider = Provider.of<FavoriteProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'CartPage');
                },
                child: Image.asset(
                  'assets/icon/cart.png',
                  color: blackColor,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Column(
          children: [
            Container(
              height: 600,
              child: ListView(
                children: favoriteProvider.favorite
                    .map(
                      (product) => FavoriteCard(product),
                    )
                    .toList(),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: blueColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Add all to my cart',
                        style: buttonTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget emptyContent() {
      return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'No Favorite Items founds',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        favoriteProvider.favorite.isEmpty ? emptyContent() : content(),
      ],
    );
  }
}
