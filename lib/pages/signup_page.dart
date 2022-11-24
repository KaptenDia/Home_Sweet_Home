import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_sweet_home/cubit/auth_cubit.dart';

import '../theme.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late final FormFieldValidator<String>? validator;

  bool tap = false;
  bool tap2 = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add(
      {
        'name': name,
        'email': email,
      },
    );
  }

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
    return Form(
      key: _formKey,
      child: Container(
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
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  'Name',
                  style: descriptionTextStyle.copyWith(
                    color: const Color(0xff909090),
                  ),
                ),
              ),
              TextFormField(
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
                controller: _nameController,
                validator: _requiredValidator,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  'Email',
                  style: descriptionTextStyle.copyWith(
                    color: const Color(0xff909090),
                  ),
                ),
              ),
              TextFormField(
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
                controller: _emailController,
                validator: _requiredValidator,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
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
              TextFormField(
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
                      tap
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off,
                    ),
                    color: blackColor,
                  ),
                ),
                obscureText: tap ? false : true,
                controller: _passwordController,
                validator: _requiredValidator,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
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
              TextFormField(
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
                        tap2 = !tap2;
                      });
                    },
                    icon: Icon(
                      tap2
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off,
                    ),
                    color: blackColor,
                  ),
                ),
                obscureText: tap2 ? false : true,
                controller: _confirmPasswordController,
                validator: _confirmPasswordValidator,
              ),
              customButton(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: warningColor,
              content: Text(
                state.error,
                textAlign: TextAlign.center,
                style: descriptionTextStyle.copyWith(
                  fontWeight: bold,
                  color: whiteColor,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 45,
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
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {}
                  context.read<AuthCubit>().signUp(
                        confirmPassword: _confirmPasswordController.text,
                        email: _emailController.text,
                        name: _nameController.text,
                        password: _passwordController.text,
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
        );
      },
    );
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return 'This field is required !';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return 'This field is required !';
    }

    if (_passwordController.text != confirmPasswordText) {
      return 'Password don\' match';
    }
    return null;
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
