class Validator {
  static String? validateEmail(String? email) {
    const emailPattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final emailRegex = RegExp(emailPattern);

    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    }

    return !emailRegex.hasMatch(email) ? 'Enter a valid email address' : null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be empty';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username can\'t be empty';
    }

    // Add more username validation criteria if needed

    return null;
  }
}
