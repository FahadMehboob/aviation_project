import 'package:aviation_project/ui/auth/login_screen.dart';
import 'package:aviation_project/widgets/circular_button.dart';
import 'package:aviation_project/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  bool isVisible = true;
  bool isVisibleOne = true;
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
              const SizedBox(
                height: 90,
              ),
              const ReusableTitle(title: "Reset Password"),
              const ReusableSubTitle(
                  subTitle:
                      "Enter your new password twice below to reset a new password"),
              const SizedBox(
                height: 40,
              ),
              const ReusableLabel(labelText: "Enter New Password"),
              TextFormField(
                obscureText: isVisible,
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: "************",
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
              const ReusableLabel(labelText: "Re-Enter New Password"),
              TextFormField(
                obscureText: isVisibleOne,
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: "************",
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
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisibleOne = !isVisibleOne;
                      });
                    },
                    child: isVisibleOne
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
              const SizedBox(
                height: 20,
              ),
              CircularButton(
                  btnText: "Reset Password",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
