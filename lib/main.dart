import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scare/bloc/Appusage%20bloc/app_usage_bloc.dart';
import 'package:scare/bloc/chatroom%20bloc/chatroom_bloc.dart';
import 'package:scare/bloc/graph_bloc/graph_bloc.dart';
import 'package:scare/bloc/iconbloc/iconbloc.dart';
import 'package:scare/bloc/language%20bloc/language_bloc.dart';
import 'package:scare/bloc/login%20bloc/loginbloc.dart';

import 'package:scare/bloc/sigin%20bloc/sigin_bloc.dart';
import 'package:scare/data/chatbotrepository.dart';
import 'package:scare/data/repository.dart';
import 'package:scare/data/userrepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scare/presentation/screens/loginpage.dart';
import 'bloc/language bloc/language_state.dart';
import 'locale/applocalization.dart';
import 'locale/language.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StartingWidget());
}

class StartingWidget extends StatefulWidget {
  const StartingWidget({super.key});

  @override
  State<StartingWidget> createState() => _StartingWidgetState();
}

class _StartingWidgetState extends State<StartingWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => MessageRepository(),
        ),
        RepositoryProvider(
          create: (context) => Userrepository(),
        ),
        RepositoryProvider(create: (context) => ChatbotRepository()),
        // RepositoryProvider(create: ((context) => RecordingService()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IconBloc(),
          ),
          BlocProvider(create: ((context) => GraphBloc())),
          BlocProvider(create: ((context) => AppUsageBloc())),
          BlocProvider(
            create: (context) =>
                ChatroomBloc(RepositoryProvider.of<ChatbotRepository>(context)),
          ),
          BlocProvider(
            create: (context) => LanguageBloc(),
          ),
          BlocProvider(
              create: ((context) =>
                  Loginbloc(RepositoryProvider.of<Userrepository>(context)))),
          BlocProvider(
              create: ((context) =>
                  Siginupbloc(RepositoryProvider.of<Userrepository>(context)))),
          // BlocProvider(
          //   create: ((context) => RecordingBloc(
          //       RepositoryProvider.of<RecordingService>(context))),
          // )
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  supportedLocales:
                      Languages.languages.map((e) => Locale(e.code)).toList(),
                  locale: state.locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  home: const Loginpage());
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
