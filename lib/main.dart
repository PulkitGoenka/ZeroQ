import 'package:flutter/material.dart';
import 'package:easyscan/routes/app_routes.dart';

void main() {
  runApp(const EasyScanApp());
}

class EasyScanApp extends StatelessWidget {
  const EasyScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes, // ✅ FIXED
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
    );
  }
}
