// ignore_for_file: sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_sweet_home/theme.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // text controller
  final _emailController = TextEditingController();

  Future passwordReset() async {
    try {
      if (_emailController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please Enter Your Email !',
              textAlign: TextAlign.center,
              style: descriptionTextStyle.copyWith(
                color: whiteColor,
                fontWeight: bold,
              ),
            ),
            duration: Duration(
              milliseconds: 1500,
            ),
            backgroundColor: warningColor,
          ),
        );
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Password reset link sent! Please Check your email',
              textAlign: TextAlign.center,
              style: descriptionTextStyle.copyWith(
                color: whiteColor,
                fontWeight: bold,
              ),
            ),
            duration: Duration(
              milliseconds: 1500,
            ),
            backgroundColor: blueColor,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      _handleforgotPassword(e);
    }
  }

  void _handleforgotPassword(e) {
    String messageToDisplay;
    switch (e.code) {
      case 'invalid-email':
        messageToDisplay = 'Invalid Email!';
        break;
      default:
        messageToDisplay = 'Your email is not registered';
        break;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Error Occurred',
          textAlign: TextAlign.center,
          style: titleTextStyle.copyWith(
            color: blueColor,
            fontWeight: bold,
          ),
        ),
        content: Text(
          messageToDisplay,
          textAlign: TextAlign.center,
          style: descriptionTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: priceTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool tap = false;

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
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Column(
        children: [
          Text(
            'Enter Your Email',
            style: titleTextStyle.copyWith(
              color: const Color(0xff909090),
              fontSize: 30,
              fontWeight: regular,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'To Reset Your Password We\'ll send you a password reset link',
            style: subtitleTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(top: 25, right: 30, bottom: 97),
      width: 345,
      height: 477,
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
                'Email',
                style: descriptionTextStyle.copyWith(
                  color: const Color(0xff909090),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              style: descriptionTextStyle.copyWith(
                color: blackColor,
              ),
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
                top: 44,
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
                onPressed: passwordReset,
                child: Text(
                  'Reset Password',
                  style: buttonTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 30,
                right: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Back to ',
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
                      'LOGIN ',
                      style: titleTextStyle.copyWith(
                        fontWeight: bold,
                        color: blueColor,
                      ),
                    ),
                  ),
                  Text(
                    ' page',
                    style: descriptionTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(100),
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
