import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/language%20bloc/langauge_event.dart';
import 'package:scare/bloc/language%20bloc/language_bloc.dart';
import 'package:scare/locale/language.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.username,
    required this.usernumber,
    required this.drawerText,
    required this.drawerIcons,
  }) : super(key: key);

  final String username;
  final String usernumber;
  final List<String> drawerText;
  final List<IconData> drawerIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $username | Prepaid LTE',
                    style: const TextStyle(
                        fontSize: 25, fontFamily: 'Pop', color: Colors.white),
                  ),
                  Text(
                    usernumber,
                    style: const TextStyle(
                        fontSize: 20, fontFamily: 'Pop', color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white38,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text(
                        'Manage',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                            child: Text(
                              drawerText[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Pop',
                                color: Colors.white,
                              ),
                            ),
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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'English',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Pop',
                      color: Colors.white,
                    ),
                  ),
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
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Telugu',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Pop',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
