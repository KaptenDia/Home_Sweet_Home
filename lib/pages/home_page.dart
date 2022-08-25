import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/product_model.dart';
import 'package:home_sweet_home/pages/detail_page.dart';
import 'package:home_sweet_home/theme.dart';
import 'package:home_sweet_home/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Container(
            child: Column(
              children: [
                Text(
                  'Home',
                  style: titleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Sweet Home',
                  style: subtitleTextStyle1.copyWith(
                    fontSize: 24,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
          leading: Image.asset(
            'assets/icon/search.png',
          ),
          actions: [
            Image.asset(
              'assets/icon/cart.png',
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: defaultMargin,
        ),
        width: 392,
        height: 65,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/c0.png',
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Popular',
                      style: descriptionTextStyle.copyWith(
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/c1.png',
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Chair',
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/c2.png',
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Table',
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/c3.png',
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Armchair',
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/c4.png',
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bed',
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon/c5.png',
                      width: 44,
                      height: 44,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Lamp',
                      style: descriptionTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        height: 528,
        width: 335,
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  product: products[index],
                ),
              ),
            ),
          ),
        ),
      );
    }    

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        header(),
        categories(),
        const SizedBox(
          height: 23,
        ),
        content(),
      ],
    );
  }
}
