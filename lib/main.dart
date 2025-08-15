import 'package:flutter/material.dart';
import 'screens/info_screen.dart';
import 'screens/pin_screen.dart';
import 'utils/storage_helper.dart';
// import 'screens/homepage_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  bool _loading = true;
  String? _savedPin;

  @override
  void initState() {
    super.initState();
    _checkPin();
  }

  void _checkPin() async {
    _savedPin = await StorageHelper.getPin();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (_savedPin != null) {
      return const PinScreen();
    } else {
      return const InfoScreen();
    }
  }
}
