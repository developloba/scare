import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scare/bloc/language%20bloc/langauge_event.dart';
import 'package:scare/bloc/language%20bloc/language_bloc.dart';
import 'package:scare/bloc/login%20bloc/loginbloc.dart';
import 'package:scare/bloc/login%20bloc/loginevent.dart';
import 'package:scare/locale/language.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/utils/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
      {Key? key,
      required this.usernumber,
      required this.drawerText,
      required this.drawerIcons,
      required this.userdata})
      : super(key: key);

  final String usernumber;
  final Usermodel userdata;
  final List<String> drawerText;
  final List<IconData> drawerIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, $usernumber| Prepaid LTE',
                    style: Style().kmediumstyle),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white38,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text('Manage', style: Style().kmediumstyle),
                  ),
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: drawerText.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              drawerIcons[index],
                              color: Colors.white,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(drawerText[index],
                                  style: Style().kmediumstyle),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.white,
                            thickness: 0.5,
                          ),
                        )
                      ],
                    ),
                  );
                })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LanguageBloc>(context).add(
                      ToggleLanguageEvent(
                        Languages.languages[
                            0], // index value can be 0 or 1 in our case
                      ), // 0 - en, 1 - es
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('English', style: Style().kmediumstyle),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<LanguageBloc>(context).add(
                      ToggleLanguageEvent(
                        Languages.languages[
                            1], // index value can be 0 or 1 in our case
                      ), // 0 - en, 1 - es
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Telugu', style: Style().kmediumstyle),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<Loginbloc>(context)
                        .add(LogOutUserEvent(token: userdata.token));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Logout', style: Style().kmediumstyle),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
