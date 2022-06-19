import 'package:companion_app/controllers/profile_controller.dart';
import 'package:companion_app/controllers/sign_up_controller.dart';
import 'package:companion_app/services/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../services/custom_colors.dart';

class ProfilePage extends GetView<ProfileController> {
  final User? user;

  const ProfilePage({this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
      future: controller.fetchUserDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Obx(
                () => Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/memphis.png',
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          right: SizeConfig.safeHorizontal! * 0.03,
                          top: SizeConfig.safeVertical! * 0.005,
                          child: IconButton(
                            enableFeedback: true,
                            iconSize: 35,
                            icon: Icon(Icons.logout, color: Colors.black),
                            onPressed: () {
                              SignUpController.to.signOutWithGoogle();
                            },
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: SizeConfig.safeVertical! * 0.1),
                            child: GFAvatar(
                              backgroundImage: NetworkImage(
                                user?.photoURL ??
                                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                              ),
                              shape: GFAvatarShape.circle,
                              radius: SizeConfig.safeHorizontal! * 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.015,
                    ),
                    Text(
                      'Welcome, ${user?.displayName ?? controller.name ?? controller.username ?? 'Buddy'}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                            fontFamily: 'JekoBold',
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.005,
                    ),
                    Text(
                      controller.email ?? user?.email,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: CustomColors.appGreen,
                            fontFamily: 'JekoBold',
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SizeConfig.safeVertical! * 0.02,
                    ),
                    controller.phone.length > 0
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.black,
                                size: 35,
                              ),
                              trailing: Icon(
                                Icons.edit,
                                color: CustomColors.appLightGrey,
                                size: 30,
                              ),
                              title: Text(
                                controller.phone,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.black,
                                      fontFamily: 'JekoBold',
                                    ),
                              ),
                              subtitle: Text(
                                'Contact',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: CustomColors.appLightGrey,
                                      fontFamily: 'JekoBold',
                                    ),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              'You had decided to stay anonymous.',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    color: CustomColors.appLightGrey,
                                    fontFamily: 'JekoBold',
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                    controller.dob.length > 0
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.cake,
                                color: Colors.black,
                                size: 35,
                              ),
                              trailing: Icon(
                                Icons.edit,
                                color: CustomColors.appLightGrey,
                                size: 30,
                              ),
                              title: Text(
                                controller.dob,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.black,
                                      fontFamily: 'JekoBold',
                                    ),
                              ),
                              subtitle: Text(
                                'Date of birth',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: CustomColors.appLightGrey,
                                      fontFamily: 'JekoBold',
                                    ),
                              ),
                            ),
                          )
                        : Container(),
                    controller.gender.length > 0
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.transgender,
                                color: Colors.black,
                                size: 35,
                              ),
                              trailing: Icon(
                                Icons.edit,
                                color: CustomColors.appLightGrey,
                                size: 30,
                              ),
                              title: Text(
                                controller.gender,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.black,
                                      fontFamily: 'JekoBold',
                                    ),
                              ),
                              subtitle: Text(
                                'Gender',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: CustomColors.appLightGrey,
                                      fontFamily: 'JekoBold',
                                    ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: CustomColors.appGreen,
            ),
          );
        }
      },
    );
  }
}
