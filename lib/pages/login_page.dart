// ignore_for_file: sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_sweet_home/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      if (_emailController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please Enter Your Email !',
                textAlign: TextAlign.center,
                style: descriptionTextStyle.copyWith(
                  color: whiteColor,
                  fontWeight: light,
                )),
            duration: Duration(
              milliseconds: 1500,
            ),
          ),
        );
      } else if (_passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please Enter Your Password !',
                textAlign: TextAlign.center,
                style: descriptionTextStyle.copyWith(
                  fontWeight: light,
                  color: whiteColor,
                )),
            duration: Duration(
              milliseconds: 1500,
            ),
          ),
        );
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Incorrect Password Or Email',
            textAlign: TextAlign.center,
            style: descriptionTextStyle.copyWith(
              fontWeight: light,
              color: whiteColor,
            ),
          ),
          duration: Duration(
            milliseconds: 2000,
          ),
        ),
      );
      print('Incorrect Password Or Email');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
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
      margin: EdgeInsets.only(
        left: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello !',
            style: titleTextStyle.copyWith(
              color: const Color(0xff909090),
              fontSize: 30,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'WELCOME BACK',
            style: subtitleTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
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
              controller: _passwordController,
              style: descriptionTextStyle.copyWith(
                color: blackColor,
              ),
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
                    tap ? Icons.remove_red_eye_outlined : Icons.visibility_off,
                  ),
                  color: blackColor,
                ),
              ),
              obscureText: tap ? false : true,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 94,
                    right: 60,
                  ),
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password',
                      style: descriptionTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                        color: blackColor,
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
                    onPressed: signIn,
                    child: Text(
                      'Log in',
                      style: buttonTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 127,
                    right: 137,
                  ),
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'SignupPage');
                    },
                    child: Text(
                      'SIGN UP',
                      style: titleTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
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
