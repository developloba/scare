import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scare/bloc/login%20bloc/loginevent.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/screens/homepage.dart';
import 'package:scare/presentation/screens/loginpage.dart';
import 'package:scare/presentation/screens/numberscreeen.dart';
import 'package:scare/presentation/utils/constants.dart';

import '../../bloc/login bloc/loginbloc.dart';
import '../../bloc/login bloc/loginstate.dart';
import '../components/homepagecomponents/appdarwer.dart';
import '../components/loginpage_components/datafield.dart';
import '../utils/scale.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordcontrol = TextEditingController();
    TextEditingController phonecontrol = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 245, 220, 176),
      body: BlocBuilder<Loginbloc, Loginstate>(
        builder: (context, state) {
          if (state is Loadingstate) {
            return Loginbody(
                phonecontrol: phonecontrol,
                passwordcontrol: passwordcontrol,
                spinner: true);
          } else if (state is Loadedstate) {
            return Scaffold(
                drawer: AppDrawer(
                    userdata: state.data,
                    usernumber: state.number,
                    drawerText: const [
                      'Profile & Settings',
                      'Recharge your Number',
                      'My Plans',
                      'My Usage',
                      'Recharge History',
                      'Statement',
                      'Settings'
                    ],
                    drawerIcons: const [
                      Icons.account_circle,
                      Icons.currency_exchange,
                      Icons.aod,
                      Icons.energy_savings_leaf,
                      Icons.update,
                      Icons.label_important,
                      Icons.settings
                    ]),
                body: Homepage(
                  data: state.data,
                  usernumber: state.number,
                  usernanme: state.name,
                ));
          } else if (state is Errorstate) {
            return Loginbody(
              phonecontrol: phonecontrol,
              passwordcontrol: passwordcontrol,
              spinner: false,
              errotext: state.error,
            );
          } else {
            return Loginbody(
                spinner: false,
                phonecontrol: phonecontrol,
                passwordcontrol: passwordcontrol);
          }
        },
      ),
    );
  }
}

class Loginbody extends StatelessWidget {
  const Loginbody(
      {Key? key,
      required this.phonecontrol,
      required this.passwordcontrol,
      required this.spinner,
      this.errotext = ''})
      : super(key: key);

  final TextEditingController phonecontrol;
  final TextEditingController passwordcontrol;
  final bool spinner;
  final String errotext;

  @override
  Widget build(BuildContext context) {
    String number = '';
    return ModalProgressHUD(
      inAsyncCall: spinner,
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
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  textAlign: TextAlign.center,
                  style: kmediumstyle,
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
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        backgroundColor:
                            const Color.fromARGB(255, 244, 139, 54)),
                    onPressed: (() {
                      BlocProvider.of<Loginbloc>(context).add(LoginUserEvent(
                          data: Usermodel(
                              number: number, password: passwordcontrol.text)));
                      passwordcontrol.clear();
                      phonecontrol.clear();
                    }),
                    child: Text(
                      'Login',
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      textAlign: TextAlign.center,
                      style: kmediumstyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New here? Create an account',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Pop',
                            color: Colors.white,
                            fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const Loginpage();
                          }),
                        );
                      },
                      child: Text('here',
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Euclid',
                              color: Color.fromARGB(255, 244, 139, 54),
                              fontSize: 18)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login with OTP',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Pop',
                            color: Colors.white,
                            fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const OtpScreen();
                          }),
                        );
                      },
                      child: Text('here',
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Euclid',
                              color: Color.fromARGB(255, 244, 139, 54),
                              fontSize: 18)),
                    )
                  ],
                ),
                Text(
                  errotext,
                  textScaleFactor: ScaleSize.textScaleFactor(context),
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
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                          textAlign: TextAlign.center,
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
