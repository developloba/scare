import 'package:flutter/material.dart';

import 'package:scare/presentation/utils/constants.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Style.mediaQueryData = MediaQuery.of(context);
    Style style = Style();

    TextEditingController authfieldcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Enter Phone number here',
                style: style.kmediumstylebalck,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: authfieldcontroller,
                  decoration: InputDecoration(
                      hintText: 'Write the code here',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor:
                            const Color.fromARGB(255, 244, 139, 54)),
                    onPressed: (() {}),
                    child: const Text('Enter code'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
