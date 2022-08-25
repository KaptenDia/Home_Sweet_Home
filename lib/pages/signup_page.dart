import 'package:flutter/material.dart';

import '../theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool tap = false;
  bool tap2 = false;

  Widget header() {
    return SafeArea(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                'assets/icon/garis.png',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Center(
              child: Image.asset(
                'assets/icon/login icon.png',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Image(
              image: AssetImage(
                'assets/icon/garis.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
      ),
      child: Text(
        'WELCOME',
        style: titleTextStyle.copyWith(
          fontSize: 24,
          fontWeight: bold,
          color: transgreyColor,
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(top: 25, right: 30, bottom: 97),
      width: 345,
      height: 580,
      decoration: BoxDecoration(
        color: whiteColor,
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color(0xffE0E0E0),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 35,
              ),
              child: Text(
                'Name',
                style: descriptionTextStyle.copyWith(
                  color: const Color(0xff909090),
                ),
              ),
            ),
            TextField(
              style: descriptionTextStyle,
              decoration: const InputDecoration(
                fillColor: Color(0xffE0E0E0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffE0E0E0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 35,
              ),
              child: Text(
                'Email',
                style: descriptionTextStyle.copyWith(
                  color: const Color(0xff909090),
                ),
              ),
            ),
            TextField(
              style: descriptionTextStyle,
              decoration: const InputDecoration(
                fillColor: Color(0xffE0E0E0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffE0E0E0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 35,
              ),
              child: Text(
                'Password',
                style: descriptionTextStyle.copyWith(
                  color: const Color(
                    0xff909090,
                  ),
                ),
              ),
            ),
            TextField(
              style: descriptionTextStyle,
              decoration: InputDecoration(
                fillColor: const Color(0xffE0E0E0),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffE0E0E0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      tap = !tap;
                    });
                  },
                  icon: Icon(
                    tap ? Icons.visibility_off : Icons.remove_red_eye_outlined,
                  ),
                  color: blackColor,
                ),
              ),
              obscureText: tap,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 35,
              ),
              child: Text(
                'Confirm Password',
                style: descriptionTextStyle.copyWith(
                  color: const Color(
                    0xff909090,
                  ),
                ),
              ),
            ),
            TextField(
              style: descriptionTextStyle,
              decoration: InputDecoration(
                fillColor: const Color(0xffE0E0E0),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffE0E0E0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      tap2 = !tap2;
                    });
                  },
                  icon: Icon(
                    tap2 ? Icons.visibility_off : Icons.remove_red_eye_outlined,
                  ),
                  color: blackColor,
                ),
              ),
              obscureText: tap2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                    left: 30,
                    right: 60,
                  ),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        'home',
                      );
                    },
                    child: Text(
                      'SIGN UP',
                      style: buttonTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have account? ',
            style: descriptionTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'LoginPage', (route) => false);
            },
            child: Text(
              'SIGN IN',
              style: titleTextStyle.copyWith(
                fontWeight: bold,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: header(),
      ),
      body: ListView(
        children: [
          title(),
          content(),
        ],
      ),
    );
  }
}
