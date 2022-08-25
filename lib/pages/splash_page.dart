import 'package:flutter/material.dart';
import 'package:home_sweet_home/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 228,
                  left: defaultMargin,
                ),
                child: Text(
                  'HOME',
                  style: titleTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  'SWEET HOME',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 28,
                  left: 59,
                ),
                child: Text(
                  'Tempat pelayanan terbaik untukmu\nyang    sedang     mencari   furniture\nrumah',
                  style: descriptionTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Center(
                child: Container(
                  width: 159,
                  height: 54,
                  margin: const EdgeInsets.only(
                    top: 154,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: blueColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'LoginPage', (route) => false);
                    },
                    child: Text(
                      'Get Started',
                      style: buttonTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
