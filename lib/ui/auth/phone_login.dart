import 'package:aviation_project/ui/auth/password_reset.dart';
import 'package:aviation_project/ui/homescreen.dart';
import 'package:aviation_project/widgets/circular_button.dart';
import 'package:aviation_project/widgets/reusable_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class PhoneNumberLogin extends StatefulWidget {
  const PhoneNumberLogin({super.key});

  @override
  State<PhoneNumberLogin> createState() => _PhoneNumberLoginState();
}

class _PhoneNumberLoginState extends State<PhoneNumberLogin> {
  final TextEditingController phoneController = TextEditingController();

  Country country = Country(
      phoneCode: "92",
      countryCode: "PK",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Pakistan",
      example: "Pakistan",
      displayName: "Pakistan",
      displayNameNoCountryCode: "PK",
      e164Key: "");
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
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
              const ReusableTitle(title: "Phone Verification"),
              const ReusableSubTitle(
                  subTitle:
                      "We need to register your phone number before getting started !"),
              const SizedBox(
                height: 40,
              ),
              const ReusableLabel(labelText: "Phone Number"),
              TextFormField(
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                controller: phoneController,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.grey),
                  hintText: "Enter Phone Number",
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
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 600),
                            context: context,
                            onSelect: ((value) {
                              setState(() {
                                country = value;
                              });
                            }));
                      },
                      child: Text(
                        "${country.flagEmoji} + ${country.phoneCode}",
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CircularButton(
                  btnText: "Send Code",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
