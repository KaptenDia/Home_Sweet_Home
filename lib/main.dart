import 'package:flutter/material.dart';
import 'package:home_sweet_home/pages/favorites_page.dart';
import 'package:home_sweet_home/pages/login_page.dart';
import 'package:home_sweet_home/pages/main_page.dart';
import 'package:home_sweet_home/pages/signup_page.dart';
import 'package:home_sweet_home/pages/splash_page.dart';
import 'package:home_sweet_home/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const Main());
}

@required
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          'LoginPage': (context) => const LoginPage(),
          'SignupPage': (context) => const SignupPage(),
          'home': (context) => const MainPage(),
          'FavoritesPage': (context) => const FavoritesPage(),
        },
      ),
    );
  }
}
