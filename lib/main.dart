import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optomatica/consts/colors.dart';
import 'package:optomatica/cubit/race_states.dart';
import 'package:optomatica/cubit/races_cubit.dart';
import 'package:optomatica/data_model/race_model.dart';
import 'package:optomatica/screens/home_screen.dart';

import 'blocObserver.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RaceCubit()..readJson(),
        child: BlocConsumer<RaceCubit,RaceStates>(
            listener: (context, state) {},
            builder: (context, state) {
              RaceCubit cubit = RaceCubit.get(context);
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: darkBlue),
                  useMaterial3: true,
                ),
                home: HomeScreen(),
              );
            }));
  }
}
