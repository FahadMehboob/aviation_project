import 'package:aviation_project/ui/auth/forget_password.dart';
import 'package:aviation_project/ui/auth/phone_login.dart';
import 'package:aviation_project/ui/auth/signup_screen.dart';
import 'package:aviation_project/ui/homescreen.dart';
import 'package:aviation_project/widgets/circular_button.dart';
import 'package:aviation_project/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import '../../widgets/reusable_outlineborder.dart';
import '../../widgets/reusable_row.dart';
import 'auth_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              const ReusableTitle(title: "Login"),
              const ReusableSubTitle(
                  subTitle: "Welcome back! Let's get started."),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ReusableLabel(labelText: "Email Address"),
                    TextFormField(
                      validator: (value) => Validator.validateEmail(value),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        errorStyle: CustomStyles.errorTextStyle(),
                        hintText: "hello@example.com",
                        enabledBorder: CustomBorders.enabledBorder(),
                        focusedBorder: CustomBorders.focusedBorder(),
                        focusedErrorBorder: CustomBorders.focusedErrorBorder(),
                        errorBorder: CustomBorders.errorBorder(),
                      ),
                    ),
                    const ReusableLabel(labelText: "Password"),
                    TextFormField(
                      validator: (value) => Validator.validatePassword(value),
                      controller: passwordController,
                      obscureText: isVisible,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        errorStyle: CustomStyles.errorTextStyle(),
                        hintText: "************",
                        enabledBorder: CustomBorders.enabledBorder(),
                        focusedBorder: CustomBorders.focusedBorder(),
                        focusedErrorBorder: CustomBorders.focusedErrorBorder(),
                        errorBorder: CustomBorders.errorBorder(),
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
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ));
                      },
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CircularButton(
                btnText: "Sign In",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
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
              CircularGoogleButton(),
              const SizedBox(
                height: 10,
              ),
              CircularButton(
                btnText: "Sign In With Phone Number",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneNumberLogin(),
                      ));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ReusableRow(
                textBtnTitle: "Sign Up",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                textTitle: "Don't have an Account ?",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
