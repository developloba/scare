import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/bloc/Appusage%20bloc/app_usage_bloc.dart';

import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/data/chatbotrepository.dart';
import 'package:scare/models/usermodel.dart';
import 'package:scare/presentation/components/homepagecomponents/opener.dart';
import 'package:scare/presentation/utils/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../bloc/Appusage bloc/app_usage_state.dart';
import '../../bloc/graph_bloc/graph_bloc.dart';
import '../../bloc/graph_bloc/graph_state.dart';
import '../../bloc/language bloc/language_bloc.dart';
import '../../bloc/language bloc/language_state.dart';
import '../../data/userdata.dart';
import '../components/homepagecomponents/graphcard.dart';
import '../components/homepagecomponents/userdatagraph.dart';

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
  List<List<UserData>> userData = [
    [
      UserData('Jan', 35),
      UserData('Feb', 28),
      UserData('Mar', 34),
      UserData('Apr', 32),
      UserData('May', 40)
    ],
    [
      UserData('Jan', 65),
      UserData('Feb', 48),
      UserData('Mar', 54),
      UserData('Apr', 30),
      UserData('May', 90)
    ],
    [
      UserData('Jan', 25),
      UserData('Feb', 38),
      UserData('Mar', 74),
      UserData('Apr', 36),
      UserData('May', 55)
    ],
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String usernumber = widget.data.number;
    getString(String string) {
      int length = string.length - 4;

      return '*' * length +
          usernumber
              .substring((usernumber.length - 4).clamp(0, usernumber.length));
    }

    return BlocProvider(
      create: (context) =>
          ChatroomBloc(RepositoryProvider.of<ChatbotRepository>(context)),
      child: SafeArea(
        child: BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {},
          child: Scaffold(
              backgroundColor: kbackgroundcolor,
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (() {
                                    Scaffold.of(context).openDrawer();
                                  }),
                                  child: SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        'assets/images/syes-01.png',
                                        fit: BoxFit.fill,
                                      ))),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Center(
                                    child: Text(
                                      widget.usernanme,
                                      style: ktextstylewhite,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                getString(usernumber),
                                style: ktextstyle,
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  'Mobile',
                                  style: ktextstylewhite,
                                ),
                              ),
                              Opener(
                                userid: usernumber,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: BlocBuilder<GraphBloc, GraphState>(
                              builder: (context, state) {
                                if (state is OnDataState) {
                                  return UserDataGraph(
                                      ktextstylewhite: ktextstylewhite,
                                      selected: state.selected,
                                      index: state.index,
                                      data: userData[state.index]);
                                }
                                if (state is OnSmsState) {
                                  return UserDataGraph(
                                    ktextstylewhite: ktextstylewhite,
                                    selected: state.selected,
                                    index: state.index,
                                    data: userData[state.index],
                                  );
                                }
                                if (state is OnVoiceState) {
                                  return UserDataGraph(
                                      ktextstylewhite: ktextstylewhite,
                                      selected: state.selected,
                                      index: state.index,
                                      data: userData[state.index]);
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            )),
                        BlocBuilder<AppUsageBloc, AppUsageState>(
                          builder: (context, state) {
                            if (state is OnOpenState) {
                              return Graphcard(
                                title: 'Top Apps in the last 7days',
                                flex: 2,
                                state: state,
                                ktextstylewhite: ktextstylewhite,
                                ktextstyle: ktextstyle,
                                graph: SfCartesianChart(
                                    title:
                                        ChartTitle(textStyle: ktextstylewhite),
                                    primaryXAxis: CategoryAxis(),
                                    series: <LineSeries<UserData, String>>[
                                      LineSeries<UserData, String>(
                                          dataSource: [
                                            UserData('Jan', 35),
                                            UserData('Feb', 28),
                                            UserData('Mar', 34),
                                            UserData('Apr', 32),
                                            UserData('May', 40)
                                          ],
                                          xValueMapper: (UserData data, _) =>
                                              data.year,
                                          yValueMapper: (UserData data, _) =>
                                              data.count)
                                    ]),
                              );
                            } else {
                              return Graphcard(
                                  title: '',
                                  state: state,
                                  flex: 1,
                                  ktextstyle: ktextstyle,
                                  ktextstylewhite: ktextstylewhite,
                                  graph: const SizedBox.shrink());
                            }
                          },
                        ),
                        Flexible(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
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
