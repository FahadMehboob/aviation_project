import 'package:flutter/material.dart';

class ReusableTitle extends StatelessWidget {
  final String title;
  const ReusableTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class ReusableSubTitle extends StatelessWidget {
  final String subTitle;
  const ReusableSubTitle({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        subTitle,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

class ReusableLabel extends StatelessWidget {
  final String labelText;
  const ReusableLabel({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        labelText,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
