import 'package:fitness_app_ui/database_helper.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/pages/components/positioned_component.dart';
import 'package:fitness_app_ui/pages/components/switch_button.dart';
import 'package:fitness_app_ui/pages/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedBodyPart = 'None';
  int? _imageNum = 0;
  String _bodyOrientation = "front";
  late Map numToImage = {0: "male", 1: "female"};

  void updateBodyImageNum(String gender) {
    if (gender == 'female') {
      setState(() {
        _imageNum = 1;
      });
    } else if (gender == 'male') {
      setState(() {
        _imageNum = 0;
      });
    }
  }

  void getData() async {
    await DatabaseHelper.instance.loadDatafromCsvAndAddIntoDb();
    // var dbQuery = await DatabaseHelper.instance.query();
    // print(dbQuery.toList().length);
    // print(dbQuery.toList());
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void updateSelectedPart(String selected) async {
    await precacheImage(AssetImage("assets/bodyPart/$selected.png"), context);
    setState((){
      selectedBodyPart = selected;
    });
    BlocProvider.of<SelectExerciseCubit>(context).updateSelectedExercise('Any', selectedBodyPart);
    await Future.delayed(const Duration(milliseconds: 50));
    setState(() {
      selectedBodyPart = 'None';
    });
    
    Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = Globals.getDeviceWidth(context);
    double imageHeight = Globals.getDeviceHeight(context) * 0.83;
    Color gestureComponentsColor = Colors.transparent;
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Stack(
          children: [
            Image.asset(
                "assets/bodyPart/$selectedBodyPart.png",
                width: imageWidth,
                height: imageHeight,
              ),
              PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.427,
                right: Globals.getDeviceWidth(context) * 0.365,
                bottom: Globals.getDeviceHeight(context) * 0.320,
                left: Globals.getDeviceWidth(context) * 0.486,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Hips');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.427,
                right: Globals.getDeviceWidth(context) * 0.486,
                bottom: Globals.getDeviceHeight(context) * 0.320,
                left: Globals.getDeviceWidth(context) * 0.365,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Hips');
                }),
            // PositionedComponent(
            //     top: Globals.getDeviceHeight(context) * 0.155,
            //     right: Globals.getDeviceWidth(context) * 0.316,
            //     bottom: Globals.getDeviceHeight(context) * 0.652,
            //     left: Globals.getDeviceWidth(context) * 0.535,
            //     colr: Colors.blue,
            //     onTap: () {
            //       updateSelectedPart('Hands');
            //     }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.374,
                right: Globals.getDeviceWidth(context) * 0.851,
                bottom: Globals.getDeviceHeight(context) * 0.395,
                left: Globals.getDeviceWidth(context) * 0.002,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Hands');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.374,
                right: Globals.getDeviceWidth(context) * 0.002,
                bottom: Globals.getDeviceHeight(context) * 0.395,
                left: Globals.getDeviceWidth(context) * 0.851,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Hands');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.171,
                right: Globals.getDeviceWidth(context) * 0.243,
                bottom: Globals.getDeviceHeight(context) * 0.609,
                left: Globals.getDeviceWidth(context) * 0.608,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Shoulders');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.171,
                right: Globals.getDeviceWidth(context) * 0.608,
                bottom: Globals.getDeviceHeight(context) * 0.609,
                left: Globals.getDeviceWidth(context) * 0.243,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Shoulders');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.288,
                right: Globals.getDeviceWidth(context) * 0.778,
                bottom: Globals.getDeviceHeight(context) * 0.459,
                left: Globals.getDeviceWidth(context) * 0.073,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Forearms');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.288,
                right: Globals.getDeviceWidth(context) * 0.073,
                bottom: Globals.getDeviceHeight(context) * 0.459,
                left: Globals.getDeviceWidth(context) * 0.778,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Forearms');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.395,
                right: Globals.getDeviceWidth(context) * 0.413,
                bottom: Globals.getDeviceHeight(context) * 0.395,
                left: Globals.getDeviceWidth(context) * 0.413,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Waist');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.342,
                right: Globals.getDeviceWidth(context) * 0.34,
                bottom: Globals.getDeviceHeight(context) * 0.449,
                left: Globals.getDeviceWidth(context) * 0.535,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Waist');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.342,
                right: Globals.getDeviceWidth(context) * 0.535,
                bottom: Globals.getDeviceHeight(context) * 0.449,
                left: Globals.getDeviceWidth(context) * 0.34,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Waist');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.604,
                right: Globals.getDeviceWidth(context) * 0.559,
                bottom: Globals.getDeviceHeight(context) * 0.053,
                left: Globals.getDeviceWidth(context) * 0.267,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Calves');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.604,
                right: Globals.getDeviceWidth(context) * 0.267,
                bottom: Globals.getDeviceHeight(context) * 0.053,
                left: Globals.getDeviceWidth(context) * 0.559,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Calves');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.556,
                right: Globals.getDeviceWidth(context) * 0.292,
                bottom: Globals.getDeviceHeight(context) * 0.224,
                left: Globals.getDeviceWidth(context) * 0.535,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Knees');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.556,
                right: Globals.getDeviceWidth(context) * 0.535,
                bottom: Globals.getDeviceHeight(context) * 0.224,
                left: Globals.getDeviceWidth(context) * 0.292,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Knees');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.043,
                right: Globals.getDeviceWidth(context) * 0.389,
                bottom: Globals.getDeviceHeight(context) * 0.759,
                left: Globals.getDeviceWidth(context) * 0.389,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('head');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.064,
                right: Globals.getDeviceWidth(context) * 0.413,
                bottom: Globals.getDeviceHeight(context) * 0.694,
                left: Globals.getDeviceWidth(context) * 0.413,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('face');
                }),
                PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.235,
                right: Globals.getDeviceWidth(context) * 0.656,
                bottom: Globals.getDeviceHeight(context) * 0.534,
                left: Globals.getDeviceWidth(context) * 0.17,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Upper Arms');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.235,
                right: Globals.getDeviceWidth(context) * 0.17,
                bottom: Globals.getDeviceHeight(context) * 0.534,
                left: Globals.getDeviceWidth(context) * 0.656,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Upper Arms');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.406,
                right: Globals.getDeviceWidth(context) * 0.292,
                bottom: Globals.getDeviceHeight(context) * 0.267,
                left: Globals.getDeviceWidth(context) * 0.559,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Thighs');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.406,
                right: Globals.getDeviceWidth(context) * 0.559,
                bottom: Globals.getDeviceHeight(context) * 0.267,
                left: Globals.getDeviceWidth(context) * 0.292,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Thighs');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.246,
                right: Globals.getDeviceWidth(context) * 0.559,
                bottom: Globals.getDeviceHeight(context) * 0.47,
                left: Globals.getDeviceWidth(context) * 0.316,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('stomach');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.139,
                right: Globals.getDeviceWidth(context) * 0.413,
                bottom: Globals.getDeviceHeight(context) * 0.652,
                left: Globals.getDeviceWidth(context) * 0.413,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('neck');
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.182,
                right: Globals.getDeviceWidth(context) * 0.328,
                bottom: Globals.getDeviceHeight(context) * 0.588,
                left: Globals.getDeviceWidth(context) * 0.311,
                colr: gestureComponentsColor,
                onTap: () {
                  updateSelectedPart('Chest'
                  );
                }),
            PositionedComponent(
                top: Globals.getDeviceHeight(context) * 0.245,
                right: Globals.getDeviceWidth(context) * 0.389,
                bottom: Globals.getDeviceHeight(context) * 0.458,
                left: Globals.getDeviceWidth(context) * 0.389,
                colr: gestureComponentsColor,
                onTap: () async {
                  updateSelectedPart('abs');
                }),
            SwitchButton(
              onChanged: updateBodyImageNum,
            ),
            Positioned(
              top: Globals.getDeviceHeight(context) * 0.74,
              left: Globals.getDeviceWidth(context) * 0.8,
              child: Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _bodyOrientation == 'front'
                          ? _bodyOrientation = 'back'
                          : _bodyOrientation = 'front';
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.rotate_right,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
