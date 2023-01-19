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
import '../../bloc/chatroom bloc/chatroom_state.dart';
import '../../bloc/graph_bloc/graph_bloc.dart';
import '../../bloc/graph_bloc/graph_state.dart';
import '../../data/userdata.dart';
import '../components/homepagecomponents/appdarwer.dart';
import '../components/homepagecomponents/chatpagecomponent.dart';
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

  List plansText = ['Pro special prepaid 2', 'Pro special prepaid 3'];
  List dataText = ['2.0 GB/day', '1.5 GB/day'];
  List validityText = ['84 days', '56days '];
  List<List<UserData>> userData = [
    [
      UserData('Mon', 35),
      UserData('Tues', 28),
      UserData('Wed', 34),
      UserData('Thurs', 32),
      UserData('Fri', 40)
    ],
    [
      UserData('Mon', 65),
      UserData('Tues', 48),
      UserData('Wed', 54),
      UserData('Thurs', 30),
      UserData('Fri', 90)
    ],
    [
      UserData('Mon', 25),
      UserData('Tues', 38),
      UserData('Wed', 55),
      UserData('Thurs', 60),
      UserData('Fri', 10)
    ],
  ];
  @override
  @override
  Widget build(BuildContext context) {
    Style.mediaQueryData = MediaQuery.of(context);
    Style style = Style();
    String usernumber = widget.data.number;

    return BlocProvider(
      create: (context) =>
          ChatroomBloc(RepositoryProvider.of<ChatbotRepository>(context)),
      child: SafeArea(
        child: Scaffold(
          drawer: AppDrawer(
              userdata: widget.data,
              usernumber: widget.usernumber,
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
          backgroundColor: kbackgroundcolor,
          body: SingleChildScrollView(
            child: BlocBuilder<AppUsageBloc, AppUsageState>(
              builder: (context, state) {
                if (state is OnCloseState) {
                  return HomeBody(
                      scale: 1.4,
                      widget: widget,
                      style: style,
                      usernumber: usernumber,
                      userData: userData,
                      plansText: plansText,
                      dataText: dataText,
                      validityText: validityText);
                } else {
                  return HomeBody(
                      scale: 1.67,
                      widget: widget,
                      style: style,
                      usernumber: usernumber,
                      userData: userData,
                      plansText: plansText,
                      dataText: dataText,
                      validityText: validityText);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.widget,
    required this.style,
    required this.usernumber,
    required this.userData,
    required this.scale,
    required this.plansText,
    required this.dataText,
    required this.validityText,
  }) : super(key: key);

  final Homepage widget;
  final Style style;
  final String usernumber;
  final List<List<UserData>> userData;
  final List plansText;
  final List dataText;
  final List validityText;
  final double scale;

  getString(String string) {
    // int length = string.length - 4;

    return '*' * 3 +
        usernumber
            .substring((usernumber.length - 4).clamp(0, usernumber.length));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * scale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (() {
                      Scaffold.of(context).openDrawer();
                    }),
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        width: MediaQuery.of(context).size.height / 15,
                        height: MediaQuery.of(context).size.height / 15,
                        child: Image.asset(
                          'assets/images/syes-03.png',
                          fit: BoxFit.fill,
                        ))),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        widget.usernanme,
                        style: style.kmediumstylebalck,
                      ),
                    ),
                  ),
                ),
                Text(
                  getString(usernumber),
                  style: style.kmediumstylebalck,
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
                    style: style.kmediumstyle,
                  ),
                ),
                BlocBuilder<ChatroomBloc, Chatroomstate>(
                  builder: (context, state) {
                    if (state is ChatroomInitialState) {
                      return IconButton(
                        icon: const Icon(
                          Icons.mic,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Scaffold.of(context).showBottomSheet(
                              backgroundColor: Colors.transparent,
                              (context) => ChatPage(
                                    userid: usernumber,
                                  ));
                        },
                      );
                    } else {
                      return Opener(
                        iconButton: IconButton(
                          icon: const Icon(
                            Icons.mic,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Scaffold.of(context).showBottomSheet(
                                backgroundColor: Colors.transparent,
                                (context) => ChatPage(
                                      userid: usernumber,
                                    ));
                            // recordingService.initRecorder();

                            // BlocProvider.of<ChatroomBloc>(context).add(
                            //     InitializeChatevent(
                            //         messageModel: const MessageModel(
                            //             message: '',
                            //             type: Messagetype.reciever,
                            //             format: Messageformat.text)));
                          },
                        ),
                        userid: usernumber,
                      );
                    }
                  },
                )
              ],
            ),
          ),
          BlocBuilder<GraphBloc, GraphState>(
            builder: (context, state) {
              if (state is OnDataState) {
                return UserDataGraph(
                    ktextstylewhite: style.kmediumstyle,
                    selected: state.selected,
                    index: state.index,
                    data: userData[state.index]);
              }
              if (state is OnSmsState) {
                return UserDataGraph(
                  ktextstylewhite: style.kmediumstyle,
                  selected: state.selected,
                  index: state.index,
                  data: userData[state.index],
                );
              }
              if (state is OnVoiceState) {
                return UserDataGraph(
                    ktextstylewhite: style.kmediumstyle,
                    selected: state.selected,
                    index: state.index,
                    data: userData[state.index]);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          BlocBuilder<AppUsageBloc, AppUsageState>(
            builder: (context, state) {
              if (state is OnOpenState) {
                return Graphcard(
                  title: '',
                  height: MediaQuery.of(context).size.height / 2,
                  flex: 3,
                  state: state,
                  ktextstylewhite: style.kmediumstyle,
                  ktextstyle: style.kmediumstylebalck,
                  graph: SfCartesianChart(
                      title: ChartTitle(textStyle: style.kmediumstyle),
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
                            xValueMapper: (UserData data, _) => data.year,
                            yValueMapper: (UserData data, _) => data.count)
                      ]),
                );
              } else {
                return Graphcard(
                    height: 150,
                    flex: 1,
                    title: '',
                    state: state,
                    ktextstyle: style.kmediumstylebalck,
                    ktextstylewhite: style.kmediumstyle,
                    graph: const SizedBox.shrink());
              }
            },
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 244, 139, 54),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text('PLAN',
                                    style: style.kmediumstylebalck),
                              ),
                            ),
                            Text(
                              'Pro Special prepaid 3',
                              style: style.kmediumstylebalck,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Expires on:',
                                    style: style.kmediumstylebalck),
                                Text('27th Oct,2022',
                                    style: style.kmediumstylebalck)
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 25,
                              width: MediaQuery.of(context).size.width / 0.5,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text('+1 active plan / Add-on',
                                    style: style.ksmallstyle),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Pro special prepaid 2',
                                    style: style.kmediumstylebalck),
                                Text('27th Oct,2022',
                                    style: style.kmediumstylebalck),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            Text('Recommended Plans',
                                style: Style().kmediumstylebalck),
                            Expanded(
                              child: PageView.builder(
                                  controller:
                                      PageController(viewportFraction: 0.6),
                                  padEnds: false,
                                  itemCount: plansText.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                plansText[index],
                                                style: style.ksmallstyle,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Data',
                                                    style: Style().ksmallstyle,
                                                  ),
                                                  Text(
                                                    dataText[index],
                                                    style: Style().ksmallstyle,
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Validity',
                                                    style: Style().ksmallstyle,
                                                  ),
                                                  Text(
                                                    validityText[index],
                                                    style: Style().ksmallstyle,
                                                  )
                                                ],
                                              ),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              245,
                                                              220,
                                                              176)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Recharge',
                                                    style:
                                                        style.ksmallstyleblack,
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
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
