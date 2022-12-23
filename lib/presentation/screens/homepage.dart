import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/data/chatbotrepository.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/components/homepagecomponents/opener.dart';

import '../../bloc/language bloc/language_bloc.dart';
import '../../bloc/language bloc/language_state.dart';
import '../components/homepagecomponents/appdarwer.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
    required this.data,
    this.usernanme = '',
    required this.usernumber,
  }) : super(key: key);
  final Usermodel data;
  final String usernanme;
  final String usernumber;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> drawerText = [
    'Profile & Settings',
    'Recharge your Number',
    'My Plans',
    'My Usage',
    'Recahrge History',
    'Statement',
    'Settings'
  ];
  List<IconData> drawerIcons = [
    Icons.account_circle,
    Icons.currency_exchange,
    Icons.aod,
    Icons.energy_savings_leaf,
    Icons.update,
    Icons.label_important,
    Icons.settings
  ];
  List<String> pageviewtext = ['Data usage', 'Voice usage', 'Sms usage'];
  TextStyle ktextstyle = const TextStyle(
    fontSize: 20,
    fontFamily: 'Pop',
    color: Colors.black,
  );
  TextStyle ktextstylewhite = const TextStyle(
    fontSize: 20,
    fontFamily: 'Pop',
    color: Colors.white,
  );
  TextStyle ktextstylewhitesmall = const TextStyle(
    fontSize: 15,
    fontFamily: 'Pop',
    color: Colors.white,
  );
  List plansText = ['Pro special prepaid 2', 'Pro special prepaid 3'];
  List dataText = ['2.0 GB/day', '1.5 GB/day'];
  List validityText = ['84 days', '56days '];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.usernanme;
    String usernumber = widget.usernumber;
    return BlocProvider(
      create: (context) =>
          ChatroomBloc(RepositoryProvider.of<ChatbotRepository>(context)),
      child: SafeArea(
        child: BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {},
          child: Scaffold(
              appBar: AppBar(
                leading: Builder(builder: ((context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                })),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Opener(
                      userid: usernumber,
                    )
                  ],
                ),
              ),
              drawer: AppDrawer(
                  username: username,
                  usernumber: usernumber,
                  drawerText: drawerText,
                  drawerIcons: drawerIcons),
              backgroundColor: const Color.fromARGB(255, 245, 220, 176),
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1.6,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: PageView.builder(
                                padEnds: false,
                                controller:
                                    PageController(viewportFraction: 0.7),
                                itemCount: pageviewtext.length,
                                itemBuilder: ((context, index) => Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                            color: Colors.black),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              pageviewtext[index],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Pop',
                                                color: Colors.white,
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/pngegg.png',
                                              scale: 3.5,
                                              fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text('App Usage',
                                            style: ktextstylewhitesmall),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Text(
                                        'Top Apps in the last 7days',
                                        style: ktextstyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      elevation: 15,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.network(
                                          'https://static.anychart.com/images/gallery/v8/bar-charts-bar-chart.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 244, 139, 54),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text('PLAN', style: ktextstyle),
                                      ),
                                    ),
                                    Text(
                                      'Pro Special prepaid 3',
                                      style: ktextstyle,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Expires on:', style: ktextstyle),
                                        Text('27th Oct,2022', style: ktextstyle)
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                        child: Text('+1 active plan / Add-on',
                                            style: ktextstylewhite),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Pro special prepaid 2',
                                            style: ktextstyle),
                                        Text('27th Oct,2022',
                                            style: ktextstyle),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 3,
                                    ),
                                    const Text(
                                      'Recommended Plans',
                                      style: TextStyle(
                                          fontFamily: 'Pop',
                                          fontSize: 25,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 400,
                                      width: 600,
                                      child: PageView.builder(
                                          controller: PageController(
                                              viewportFraction: 0.6),
                                          padEnds: false,
                                          itemCount: plansText.length,
                                          itemBuilder: ((context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        plansText[index],
                                                        style: ktextstylewhite,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Data',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Pop',
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            dataText[index],
                                                            style:
                                                                const TextStyle(
                                                                    fontFamily:
                                                                        'Pop',
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Validity',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Pop',
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            validityText[index],
                                                            style:
                                                                const TextStyle(
                                                                    fontFamily:
                                                                        'Pop',
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white),
                                                          )
                                                        ],
                                                      ),
                                                      ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              backgroundColor:
                                                                  const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      245,
                                                                      220,
                                                                      176)),
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Recharge',
                                                            style: ktextstyle,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
