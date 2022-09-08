import 'package:flutter/material.dart';
import 'package:home_sweet_home/providers/cart_provider.dart';
import 'package:home_sweet_home/widgets/cart_card.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'My Cart',
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
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icon/back.png',
                color: blackColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Ooops! Your Cart is Empty',
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: cartProvider.carts
            .map(
              (cart) => CartCard(cart),
            )
            .toList(),
      );
    }

    Widget customBottomNavBar() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: descriptionTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Rp. ${cartProvider.totalPrice()}',
                    style: descriptionTextStyle.copyWith(
                      color: blackColor,
                      fontWeight: bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: defaultMargin,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: blueColor,
                ),
                onPressed: () {},
                child: Text(
                  'Check Out',
                  style: buttonTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: header(),
      ),
      body: cartProvider.carts.isEmpty ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.carts.isEmpty ? SizedBox() : customBottomNavBar(),
    );
  }
}
