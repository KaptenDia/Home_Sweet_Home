import 'package:flutter/material.dart';

import '../theme.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: double.infinity,
      height: 80,
      color: whiteColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: descriptionTextStyle.copyWith(
                      fontWeight: bold,
                      color: blackColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    subtitle,
                    style: descriptionTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Image.asset(
              'assets/icon/next.png',
            ),
          ),
        ],
      ),
    );
  }
}
