import 'package:companion_app_nihar/bindings/auth_binding.dart';
import 'package:companion_app_nihar/bindings/home_binding.dart';
import 'package:companion_app_nihar/bindings/login_binding.dart';
import 'package:companion_app_nihar/bindings/main_screen_binding.dart';
import 'package:companion_app_nihar/bindings/onboarding_binding.dart';
import 'package:companion_app_nihar/bindings/profile_binding.dart';
import 'package:companion_app_nihar/bindings/sign_up_binding.dart';
import 'package:companion_app_nihar/bindings/specialist_binding.dart';
import 'package:companion_app_nihar/bindings/survey_binding.dart';
import 'package:companion_app_nihar/bindings/task_list_binding.dart';
import 'package:companion_app_nihar/constants/routes.dart';
import 'package:companion_app_nihar/constants/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  SurveyBinding().dependencies();
  MainScreenBinding().dependencies();
  SignUpBinding().dependencies();
  LoginBinding().dependencies();
  HomeBinding().dependencies();
  TaskListBinding().dependencies();
  SpecialistBinding().dependencies();
  ProfileBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FirebaseAuthentication().logOut();
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
