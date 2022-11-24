import 'package:flutter/material.dart';

import '../theme.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Notification',
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
              onTap: () {},
              child: Image.asset(
                'assets/icon/search.png',
                color: blackColor,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
      ],
    );
  }
}
