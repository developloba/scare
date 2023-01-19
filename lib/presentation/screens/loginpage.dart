import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_bloc.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_state.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/screens/signuppage.dart';
import 'package:scare/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../bloc/sigin bloc/sigin_events.dart';
import '../components/loginpage_components/datafield.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController usernamecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController phonecontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Style.mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 245, 220, 176),
      body: BlocBuilder<Siginupbloc, Signinstate>(
        builder: (context, state) {
          if (state is Loadingstate) {
            return SigninBody(
                spinner: true,
                usernamecontrol: usernamecontrol,
                emailcontrol: emailcontrol,
                phonecontrol: phonecontrol,
                passwordcontrol: passwordcontrol);
          } else if (state is Loadedstate) {
            return const Signup();
          } else if (state is Errorstate) {
            return SigninBody(
              usernamecontrol: usernamecontrol,
              emailcontrol: emailcontrol,
              phonecontrol: phonecontrol,
              passwordcontrol: passwordcontrol,
              spinner: false,
              errortext: state.error,
            );
          } else {
            return SigninBody(
                spinner: false,
                usernamecontrol: usernamecontrol,
                emailcontrol: emailcontrol,
                phonecontrol: phonecontrol,
                passwordcontrol: passwordcontrol);
          }
        },
      ),
    );
  }
}

class SigninBody extends StatefulWidget {
  const SigninBody(
      {Key? key,
      required this.usernamecontrol,
      required this.emailcontrol,
      required this.phonecontrol,
      required this.passwordcontrol,
      required this.spinner,
      this.errortext = ''})
      : super(key: key);

  final TextEditingController usernamecontrol;
  final TextEditingController emailcontrol;
  final TextEditingController phonecontrol;
  final TextEditingController passwordcontrol;
  final bool spinner;
  final String errortext;

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  @override
  @override
  Widget build(BuildContext context) {
    Style.mediaQueryData = MediaQuery.of(context);
    Style style = Style();
    return ModalProgressHUD(
      inAsyncCall: widget.spinner,
      child: Center(
        child: Container(
            clipBehavior: Clip.antiAlias,
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 64, 50, 23)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Enter details below',
                  style: style.kmediumstyle,
                  textAlign: TextAlign.center,
                ),
                // Datafield(
                //   textEditingController: usernamecontrol,
                //   hinttext: 'Enter Username Here',
                // ),
                // Datafield(
                //   textEditingController: emailcontrol,
                //   hinttext: 'Enter your email here',
                //   inputype: TextInputType.emailAddress,
                // ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 1.7,
                //   height: MediaQuery.of(context).size.height / 10,
                //   child: IntlPhoneField(
                //     initialCountryCode: 'NG',
                //     onChanged: (phone) {
                //       number = phone.completeNumber;
                //     },
                //     controller: widget.phonecontrol,
                //     decoration: InputDecoration(
                //         hintText: 'Enter your number here',
                //         filled: true,
                //         fillColor: Colors.white,
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(30),
                //             borderSide: const BorderSide(color: Colors.white)),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(30),
                //             borderSide: const BorderSide(color: Colors.white))),
                //   ),
                // ),
                Datafield(
                    obsuretext: false,
                    textEditingController: widget.phonecontrol,
                    hinttext: 'Enter your phone number here'),
                Datafield(
                    obsuretext: true,
                    textEditingController: widget.passwordcontrol,
                    hinttext: 'Enter your password here'),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor:
                            const Color.fromARGB(255, 244, 139, 54)),
                    onPressed: (() {
                      BlocProvider.of<Siginupbloc>(context).add(CreateUserEvent(
                          data: Usermodel(
                        password: widget.passwordcontrol.text.trim(),
                        number: widget.phonecontrol.text.trim(),
                      )));
                      // widget.passwordcontrol.clear();
                      // widget.phonecontrol.clear();
                    }),
                    child: Text(
                      'Sign up',
                      style: style.kmediumstyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Pop',
                            color: Colors.white,
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const Signup();
                            }),
                          );
                        },
                        child: const Text('here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Pop',
                                color: Color.fromARGB(255, 244, 139, 54),
                                fontSize: 18)),
                      )
                    ],
                  ),
                ),
                Text(
                  widget.errortext,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Pop', color: Colors.red, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'or',
                          style: style.kmediumstyle,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: const Icon(
                    Icons.mic_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
