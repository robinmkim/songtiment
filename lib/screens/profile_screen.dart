import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'home';
  static const routeURL = '/home';
  final void Function(int) onTap;

  const ProfileScreen({super.key, required this.onTap});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Text("Profile"),
          )
        ],
      ),
    );
  }
}
