import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_sweet_home/pages/favorites_page.dart';
import 'package:home_sweet_home/pages/login_page.dart';
import 'package:home_sweet_home/pages/notification_page.dart';
import 'package:home_sweet_home/pages/profile_page.dart';
import 'package:home_sweet_home/theme.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget bottomNavigation() {
    return BottomAppBar(
      child: BottomNavigationBar(
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            print(value);
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                currentIndex == 0
                    ? 'assets/icon/home1.png'
                    : 'assets/icon/home0.png',
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                currentIndex == 1
                    ? 'assets/icon/favorite1.png'
                    : 'assets/icon/favorite0.png',
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                currentIndex == 2
                    ? 'assets/icon/notif1.png'
                    : 'assets/icon/notif0.png',
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                currentIndex == 3
                    ? 'assets/icon/profile1.png'
                    : 'assets/icon/profile0.png',
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
        break;
      case 1:
        return FavoritesPage();
        break;
      case 2:
        return const NotificationPage();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavigation(),
      body: body(),
    );
  }
}
