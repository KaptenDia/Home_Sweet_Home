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
        height: 205,
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 44,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Material(
                elevation: 1,
                color: Color(0xffFCFCFC),
                child: TextFormField(
                  style: descriptionTextStyle.copyWith(
                    color: greyColor,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icon/prmt.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: whiteColor,
                    hintText: 'Enter your promo code',
                    hintStyle: descriptionTextStyle.copyWith(
                      color: greyColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 24,
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
                bottom: 20,
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
      backgroundColor: Color(0xffFCFCFC),
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
