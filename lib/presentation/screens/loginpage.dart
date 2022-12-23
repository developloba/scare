import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_bloc.dart';
import 'package:scare/bloc/sigin%20bloc/sigin_state.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/screens/homepage.dart';
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
            return Homepage(
              data: state.data,
              usernanme: state.data.username,
              usernumber: state.data.number,
            );
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

class SigninBody extends StatelessWidget {
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
  Widget build(BuildContext context) {
    String number = '';
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Center(
        child: Container(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 64, 50, 23)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Enter details below',
                  style: kmediumstyle,
                ),
                Datafield(
                  textEditingController: usernamecontrol,
                  hinttext: 'Enter Username Here',
                ),
                Datafield(
                  textEditingController: emailcontrol,
                  hinttext: 'Enter your email here',
                  inputype: TextInputType.emailAddress,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: IntlPhoneField(
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      number = phone.completeNumber;
                    },
                    controller: phonecontrol,
                    decoration: InputDecoration(
                        hintText: 'Enter your number here',
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
                Datafield(
                    obsuretext: true,
                    textEditingController: passwordcontrol,
                    hinttext: 'Enter your password here'),
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
                      BlocProvider.of<Siginupbloc>(context).add(CreateUserEvent(
                          data: Usermodel(
                              username: usernamecontrol.text,
                              password: passwordcontrol.text,
                              number: number,
                              email: emailcontrol.text)));
                    }),
                    child: Text(
                      'Sign up',
                      style: kmediumstyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? Login',
                        style: TextStyle(
                            fontFamily: 'Pop',
                            color: Colors.white,
                            fontSize: 18)),
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
                          style: TextStyle(
                              fontFamily: 'Pop',
                              color: Color.fromARGB(255, 244, 139, 54),
                              fontSize: 18)),
                    )
                  ],
                ),
                Text(
                  errortext,
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
                          style: kmediumstyle,
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
