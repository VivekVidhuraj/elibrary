import 'package:elibrary/view/home_screen.dart';
import 'package:elibrary/view/loginscreen.dart';
import 'package:elibrary/view/otp_validation.dart';
import 'package:elibrary/view/register.dart';
import 'package:elibrary/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';


main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
debugShowCheckedModeBanner: false,
        initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const SplashScreen()),
            GetPage(name: '/login', page: () => const LoginScreen()),
            GetPage(name: '/otp_validation', page: () {
              final email = Get.parameters['email'];
              if (email == null) {
                throw ArgumentError('email parameter is required for OTPValidationScreen');
              }
              return OTPValidationScreen(email: email);
            }), // Define the OTPValidationScreen route
            GetPage(name: '/register', page: () => const RegisterScreen()),
            GetPage(name: '/homescreen', page: () => const HomeScreen()),
              ],
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
              body: Center(
                child: Text('Page not found'),
              ),
          ),
          
        ),
      ),
    );
  }
}

