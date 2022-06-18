import 'package:companion_app/bindings/auth_binding.dart';
import 'package:companion_app/bindings/login_binding.dart';
import 'package:companion_app/bindings/onboarding_binding.dart';
import 'package:companion_app/bindings/sign_up_binding.dart';
import 'package:companion_app/constants/routes.dart';
import 'package:companion_app/constants/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await loadServices();
  loadDependencies();
  await GetStorage.init();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

Future<void> loadServices() async {}

void loadDependencies() {
  AuthBinding().dependencies();
  OnboardingBinding().dependencies();
  SignUpBinding().dependencies();
  LoginBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Companion App - Mental Health Tracker',
      initialRoute: "/auth",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      themeMode: ThemeMode.light,
      theme: AppThemes.lightTheme,
    );
  }
}
