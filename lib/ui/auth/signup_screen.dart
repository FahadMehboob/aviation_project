import 'dart:async';
import 'package:aviation_project/Utils/utils.dart';
import 'package:aviation_project/ui/auth/auth_validator.dart';
import 'package:aviation_project/ui/auth/login_screen.dart';
import 'package:aviation_project/ui/auth/phone_login.dart';
import 'package:aviation_project/widgets/circular_button.dart';
import 'package:aviation_project/widgets/reusable_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/reusable_outlineborder.dart';
import '../../widgets/reusable_row.dart';
import '../homescreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Timer _timer;

  void _clearFormFields() {
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
  }

  void _checkEmailVerification() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        icon: const Icon(
          Icons.mark_email_read_outlined,
          size: 80,
          color: Colors.blue,
        ),
        title: Text(
          'Email Sent',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          'Please verify your email to proceed.',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );

    // Start a timer to check email verification status periodically
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _auth.currentUser!.reload();
      if (_auth.currentUser!.emailVerified) {
        // Navigate to home screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
        _timer.cancel(); // Stop the timer once email is verified
      }
    });
  }

  bool isVisible = true;
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 70,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReusableTitle(title: "Create an Account"),
              const ReusableSubTitle(
                  subTitle: "Book your next adventure with us!"),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableLabel(labelText: "Name"),
                      TextFormField(
                        controller: usernameController,
                        validator: (value) => Validator.validateUsername(value),
                        keyboardType: TextInputType.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "Babar Azam",
                          enabledBorder: CustomBorders.enabledBorder(),
                          focusedBorder: CustomBorders.focusedBorder(),
                          focusedErrorBorder:
                              CustomBorders.focusedErrorBorder(),
                          errorBorder: CustomBorders.errorBorder(),
                          errorStyle: CustomStyles.errorTextStyle(),
                        ),
                      ),
                      const ReusableLabel(labelText: "Email Address"),
                      TextFormField(
                        validator: (value) => Validator.validateEmail(value),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "hello@example.com",
                          enabledBorder: CustomBorders.enabledBorder(),
                          focusedBorder: CustomBorders.focusedBorder(),
                          focusedErrorBorder:
                              CustomBorders.focusedErrorBorder(),
                          errorBorder: CustomBorders.errorBorder(),
                          errorStyle: CustomStyles.errorTextStyle(),
                        ),
                      ),
                      const ReusableLabel(labelText: "Password"),
                      TextFormField(
                        validator: (value) => Validator.validatePassword(value),
                        controller: passwordController,
                        obscureText: isVisible,
                        keyboardType: TextInputType.emailAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: "************",
                          enabledBorder: CustomBorders.enabledBorder(),
                          focusedBorder: CustomBorders.focusedBorder(),
                          focusedErrorBorder:
                              CustomBorders.focusedErrorBorder(),
                          errorBorder: CustomBorders.errorBorder(),
                          errorStyle: CustomStyles.errorTextStyle(),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: isVisible
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.visibility_outlined,
                                    size: 30,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              CircularButton(
                loading: loading,
                btnText: "Sign Up",
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await _auth
                          .createUserWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString(),
                      )
                          .then((value) async {
                        Utils().toastMessage(
                          context,
                          'User Registered Successfully',
                          ContentType.success,
                          'Welcome',
                        );
                        await _auth.currentUser!.sendEmailVerification();
                      });
                      _checkEmailVerification();
                      _clearFormFields();
                    } catch (error) {
                      String errorMessage = 'An error occurred';
                      if (error is FirebaseAuthException) {
                        switch (error.code) {
                          case 'email-already-in-use':
                            errorMessage =
                                'The email address is already in use';
                            break;
                          case 'invalid-email':
                            errorMessage = 'Invalid email address';
                            break;
                          case 'weak-password':
                            errorMessage = 'The password is too weak';
                            break;
                          default:
                            errorMessage = 'Authentication failed';
                        }
                      }
                      Utils().toastMessage(
                        context,
                        errorMessage,
                        ContentType.failure,
                        'On Snap!',
                      );
                    }
                  }
                },
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 80,
                      thickness: 1,
                      color: Colors.grey,
                      endIndent: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or",
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  const Expanded(
                    child: Divider(
                      height: 80,
                      thickness: 1,
                      color: Colors.grey,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              const CircularGoogleButton(),
              const SizedBox(
                height: 10,
              ),
              CircularButton(
                btnText: "Sign Up With Phone Number",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneNumberLogin(),
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ReusableRow(
                textBtnTitle: "Login",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                textTitle: "Already have an Account ?",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
