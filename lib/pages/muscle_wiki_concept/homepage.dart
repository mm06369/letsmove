import 'package:fitness_app_ui/database_helper.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/switch_button.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    var dbQuery = await DatabaseHelper.instance.query();
    print(dbQuery.toList().length);
    print(dbQuery.toList());
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Stack(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/${numToImage[_imageNum]}_${_bodyOrientation}_image.png",
              width: Globals.getDeviceWidth(context),
              height: Globals.getDeviceHeight(context) * 0.83,
            ),
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
