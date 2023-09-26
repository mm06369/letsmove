import 'dart:io';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/activity/activity_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/calorie/calorie_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/pages/components/bottom_nav.dart';
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
          BlocProvider<ActivityCubit>(create: (context) => ActivityCubit()),
          BlocProvider<SelectExerciseCubit>(
              create: (context) => SelectExerciseCubit()),
          BlocProvider<CalorieCubit>(create: (context) => CalorieCubit()),

        ],
        child: MaterialApp(
          theme: ThemeData(backgroundColor: Colors.white),
          home: Scaffold(
            // body: ActivityScreen(),
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
