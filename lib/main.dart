import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_sweet_home/cubit/auth_cubit.dart';
import 'package:home_sweet_home/pages/cart_page.dart';
import 'package:home_sweet_home/pages/favorites_page.dart';
import 'package:home_sweet_home/pages/forgot_password_page.dart';
import 'package:home_sweet_home/pages/login_page.dart';
import 'package:home_sweet_home/pages/main_page.dart';
import 'package:home_sweet_home/pages/signup_page.dart';
import 'package:home_sweet_home/pages/get_started_page.dart';
import 'package:home_sweet_home/pages/splash_page.dart';
import 'package:home_sweet_home/providers/cart_provider.dart';
import 'package:home_sweet_home/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}

@required
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AuthCubit()),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const Splashpage(),
            'GetStarted': (context) => const GetStartedPage(),
            'LoginPage': (context) => const LoginPage(),
            'SignupPage': (context) => const SignupPage(),
            'home': (context) => const MainPage(),
            'FavoritesPage': (context) => FavoritesPage(),
            'CartPage': (context) => const CartPage(),
            'ForgotPasswordPage': (context) => const ForgotPasswordPage(),
          },
        ),
      ),
    );
  }
}
