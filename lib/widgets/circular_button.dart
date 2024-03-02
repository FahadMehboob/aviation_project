import 'package:aviation_project/services/google_auth_service.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';
import '../ui/homescreen.dart';

class CircularButton extends StatelessWidget {
  final String btnText;
  final bool loading;
  final VoidCallback onTap;

  const CircularButton({
    super.key,
    required this.btnText,
    this.loading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlue,
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  btnText,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
        ),
      ),
    );
  }
}

class CircularGoogleButton extends StatelessWidget {
  void checkGoogleSignIn(context) async {
    try {
      await _googleAuthService.signInWithGoogle(context);
      if (_auth.currentUser != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      }
    } catch (error) {
      Utils().toastMessage(
        context,
        error.toString(),
        ContentType.failure,
        'Google Sign-In Error',
      );
    }
  }

  final GoogleAuthService _googleAuthService = GoogleAuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CircularGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        checkGoogleSignIn(context);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google-icon.png",
              height: 40,
              width: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Continue with Google",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
