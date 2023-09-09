import 'dart:io';


import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/calorie/calorie_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';

// import 'package:fitness_app_ui/pages/exercises/choose_exercise.dart';
// import 'package:fitness_app_ui/pages/exercises/select_level.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/bottom_nav.dart';
// import 'package:fitness_app_ui/pages/muscle_wiki_concept/homepage.dart';
// import 'package:fitness_app_ui/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/muscle_wiki/detail/detail_cubit.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
 
          BlocProvider<DetailCubit>(create: (context) => DetailCubit()),
          BlocProvider<SelectExerciseCubit>(
              create: (context) => SelectExerciseCubit()),
          BlocProvider<CalorieCubit>(create: (context) => CalorieCubit()),

        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Geometria'),
          home: Scaffold(
            body: BottomNavigation(),
          ),
        ));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
