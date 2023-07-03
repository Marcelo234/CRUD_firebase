
import 'package:crud_firebase/pages/QrScanPage.dart';
import 'package:crud_firebase/pages/add_name_page.dart';
import 'package:crud_firebase/pages/edit_name_page.dart';
import 'package:crud_firebase/pages/home_page.dart';
import 'package:crud_firebase/pages/login_page.dart';
import 'package:crud_firebase/pages/perfil_page.dart';
import 'package:crud_firebase/pages/splashscreen.dart';
import 'package:crud_firebase/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario Ferregis',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/Welcome': (context) => const WelcomePage(),
        '/Ingreso': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/add': (context) => const AddNamePage(),
        '/edit': (context) => const EditNamePage(),
        '/codigoQr': (context) => QrScanPage(),
        '/perfil':(context) => const ProfilePage(),
      },
    );
  }
}


