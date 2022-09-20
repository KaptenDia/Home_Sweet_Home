import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_sweet_home/models/get_name.dart';
import 'package:home_sweet_home/theme.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  // document IDs
  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (element) {
              print(element.reference);
            },
          ),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  Widget profile() {
    return Container(
      margin: const EdgeInsets.only(
        top: 14,
        left: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/p1.png',
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (''),
                  style: descriptionTextStyle.copyWith(
                    color: blackColor,
                    fontWeight: bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  'Markisa123@gmail.com',
                  style: descriptionTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orders() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: 335,
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
                    'My orders',
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
                    'Already have 10 orders',
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

  Widget shipping() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: 335,
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
                    'Shipping Addresses',
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
                    '03 Addresses',
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

  Widget payment() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: 335,
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
                    'Payment Method',
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
                    'You Have 2 Cards',
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

  Widget review() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: 335,
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
                    'My reviews',
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
                    'Review for 5 items',
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

  Widget setting() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      width: 335,
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
                    'Setting',
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
                    'Notification,Password,FAQ,Contact',
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

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: subtitleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          leading: Image.asset(
            'assets/icon/search.png',
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'LoginPage', (route) => false);
              },
              child: Image.asset(
                'assets/icon/exit.png',
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        profile(),
        SizedBox(
          height: defaultMargin,
        ),
        orders(),
        shipping(),
        payment(),
        review(),
        setting(),
      ],
    );
  }
}
