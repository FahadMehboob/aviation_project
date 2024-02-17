import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final VoidCallback onTap;
  final String textTitle, textBtnTitle;
  const ReusableRow(
      {super.key,
      required this.textTitle,
      required this.onTap,
      required this.textBtnTitle});

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
          onPressed: onTap,
          child: Text(
            textBtnTitle,
            style: const TextStyle(fontSize: 22),
          ),
        )
      ],
    );
  }
}
