import 'package:flutter/material.dart';

OutlineInputBorder customOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color),
  );
}

TextStyle customErrorTextStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
}

class CustomBorders {
  static OutlineInputBorder enabledBorder() {
    return customOutlineInputBorder(Colors.grey);
  }

  static OutlineInputBorder focusedBorder() {
    return customOutlineInputBorder(Colors.lightBlue);
  }

  static OutlineInputBorder focusedErrorBorder() {
    return customOutlineInputBorder(Colors.red);
  }

  static OutlineInputBorder errorBorder() {
    return customOutlineInputBorder(Colors.red);
  }
}

class CustomStyles {
  static TextStyle errorTextStyle() {
    return customErrorTextStyle();
  }
}
