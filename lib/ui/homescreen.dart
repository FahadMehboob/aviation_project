import 'package:aviation_project/services/google_auth_service.dart';
import 'package:aviation_project/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          InkWell(
              onTap: () {
                GoogleAuthService().signOut(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              child: const Icon(Icons.logout_sharp))
        ],
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
