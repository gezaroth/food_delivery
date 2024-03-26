import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth/auth_gate.dart';
import 'package:food_delivery/services/auth/login_or_register.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/themes/theme_provider.dart';
import 'package:food_delivery/views/login_page.dart';
import 'package:food_delivery/views/prueba.dart';
import 'package:food_delivery/views/register_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
