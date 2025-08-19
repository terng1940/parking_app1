import 'package:flutter/material.dart';
import 'screens/info_screen.dart';
import 'screens/login_screen.dart';
import 'screens/pin_screen.dart';
import 'utils/storage_helper.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
     theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Prompt'),
      home: const SplashDecider(),
    );
  }
}

class SplashDecider extends StatefulWidget {
  const SplashDecider({super.key});

  @override
  State<SplashDecider> createState() => _SplashDeciderState();
}

class _SplashDeciderState extends State<SplashDecider> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    final hasUser = await StorageHelper.hasUser();
    final isLoggedIn = await StorageHelper.getSession();

    Widget nextScreen;

    if (!hasUser) {
      nextScreen = const InfoScreen();
    } else if (isLoggedIn) {
      nextScreen = const PinScreen();
    } else {
      nextScreen = const LoginScreen();
    }

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
