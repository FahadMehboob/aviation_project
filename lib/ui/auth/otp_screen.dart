import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/circular_button.dart';
import '../../widgets/reusable_text.dart';
import '../homescreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
              const ReusableTitle(title: "OTP Verification"),
              const ReusableSubTitle(
                  subTitle:
                      "Enter the verification code we just sent on your phone number"),
              const SizedBox(
                height: 60,
              ),
              Pinput(
                autofocus: true,
                errorPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.red.shade600,
                    ),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                submittedPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.green.shade600,
                    ),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CircularButton(
                  btnText: "Verify",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  }),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  "Didn't recieve any code ?",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
