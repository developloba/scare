import 'package:flutter/material.dart';
import 'package:scare/models/authentication_model.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/components/homepagecomponents/recordingnotification.dart';
import 'package:scare/presentation/screens/homepage.dart';
import 'package:scare/presentation/utils/constants.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage(
      {super.key, required this.authmodel, required this.data});
  final Authmodel authmodel;
  final Usermodel data;

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  TextEditingController authfieldcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String userNumber = widget.data.number;
    Style.mediaQueryData = MediaQuery.of(context);
    Style style = Style();

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
                'Enter Code sent to $userNumber here',
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
                    onPressed: (() {
                      if (authfieldcontroller.text == widget.authmodel.pin) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => Homepage(
                                    data: widget.data,
                                    usernumber: widget.data.number))));
                      } else {
                        Scaffold.of(context).showBottomSheet((context) =>
                            const AppNotification(message: 'Incorrect pin'));
                      }
                    }),
                    child: const Text('Enter code'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
