import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final String textTitle;
  const ReusableRow({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Sign In",
            style: TextStyle(fontSize: 22),
          ),
        )
      ],
    );
  }
}
