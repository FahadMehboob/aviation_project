import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;

  const CircularButton({
    super.key,
    required this.btnText,
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
          child: Text(
            btnText,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}

class CircularGoogleButton extends StatelessWidget {
  const CircularGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
