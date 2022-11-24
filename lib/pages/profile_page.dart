import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_sweet_home/cubit/auth_cubit.dart';
import 'package:home_sweet_home/theme.dart';
import 'package:home_sweet_home/widgets/setting_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget profile() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                        state.user.name,
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
                        state.user.email,
                        style: descriptionTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget settingTile() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SettingTile(
          title: 'My Orders',
          subtitle: 'Already have 10 orders',
        ),
        const SettingTile(
          title: 'Shipping Addresses',
          subtitle: '03 Addresses',
        ),
        const SettingTile(
          title: 'Payment Method',
          subtitle: 'You have 2 cards',
        ),
        const SettingTile(
          title: 'My Reviews',
          subtitle: 'Review for 5 items',
        ),
        const SettingTile(
          title: 'Setting',
          subtitle: 'Notification,Password,FAQ,Contact',
        ),
      ],
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
            ),
          ),
          leading: Image.asset(
            'assets/icon/search.png',
          ),
          actions: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthFailed) {
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
                } else if (state is AuthInitial) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'LoginPage', (route) => false);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    context.read<AuthCubit>().signOut();
                  },
                  child: Image.asset(
                    'assets/icon/exit.png',
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      children: [
        header(),
        profile(),
        SizedBox(
          height: defaultMargin,
        ),
        settingTile(),
      ],
    );
  }
}
