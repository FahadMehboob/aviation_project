import 'package:aviation_project/ui/auth/password_reset.dart';
import 'package:aviation_project/widgets/circular_button.dart';
import 'package:aviation_project/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const ReusableTitle(title: "Forget Password?"),
              const ReusableSubTitle(
                  subTitle:
                      "Enter your email address to get the password reset link"),
              const SizedBox(
                height: 40,
              ),
              const ReusableLabel(labelText: "Email Address"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: "hello@example.com",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.lightBlue),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CircularButton(
                  btnText: "Password Reset",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PasswordReset(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
