import 'package:flutter/material.dart';

import '../theme.dart';

class SelectedColor extends StatelessWidget {
  bool isSelected = false;
  final Color color;
  SelectedColor({Key? key, required this.color, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        right: 15,
        left: 15,
      ),
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? greyColor : Color(0xffF0F0F0),
          width: 4,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
