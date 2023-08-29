import 'package:flutter/material.dart';

import '../exercise_detail.dart';

class ButtonRow extends StatefulWidget {
  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  bool _frontButtonPressed = true;
  bool backButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your button onPressed logic here
                setState(() {
                  if (backButtonPressed) {
                    _frontButtonPressed = true;
                    backButtonPressed = false;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _frontButtonPressed ? Colors.orange : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.orange),
                ),
              ),
              child: Text(
                'Front',
                style: TextStyle(
                  color: _frontButtonPressed ? Colors.white : Colors.orange,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_frontButtonPressed) {
                    _frontButtonPressed = false;
                    backButtonPressed = true;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    backButtonPressed ? Colors.orange : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.orange),
                ),
              ),
              child: Text(
                'Back',
                style: TextStyle(
                  color: backButtonPressed ? Colors.white : Colors.orange,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Stack(children: [
          Center(
              child: Image.asset(
            _frontButtonPressed
                ? "assets/images/front_image.png"
                : "assets/images/back_image.png",
            width: 300,
            height: 300,
          )),
          if (_frontButtonPressed)
            Positioned(
              top: 45,
              left: 165,
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ExerciseDetail(bodyPartName: 'neck'))),
                child: Container(
                  width: 12,
                  height: 12,
                  color: Colors.green,
                  child: const Center(child: Text('4')),
                ),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 64,
              left: 160,
              child: Container(
                width: 20,
                height: 20,
                color: Colors.red,
                child: const Center(child: Text('1')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 100,
              left: 150,
              child: Container(
                width: 40,
                height: 20,
                color: Colors.blue,
                child: const Center(child: Text('2')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 100,
              left: 120,
              child: Container(
                width: 20,
                height: 40,
                color: Colors.orange,
                child: const Center(child: Text('2')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 100,
              left: 200,
              child: Container(
                width: 20,
                height: 40,
                color: Colors.orange,
                child: const Center(child: Text('3')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 63,
              left: 195,
              child: Container(
                width: 20,
                height: 35,
                color: Colors.pink,
                child: const Center(child: Text('5')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 63,
              left: 130,
              child: Container(
                width: 20,
                height: 35,
                color: Colors.pink,
                child: const Center(child: Text('5')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
              top: 43,
              left: 130,
              child: Container(
                width: 20,
                height: 15,
                color: Colors.yellow,
                child: const Center(child: Text('6')),
              ),
            ),
          if (_frontButtonPressed)
            Positioned(
                top: 43,
                left: 195,
                child: Container(
                  width: 20,
                  height: 15,
                  color: Colors.yellow,
                  child: const Center(child: Text('6')),
                )),
          if (backButtonPressed)
            Positioned(
                top: 70,
                left: 150,
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ExerciseDetail(bodyPartName: 'back'))),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.purple,
                    child: const Center(child: Text('7')),
                  ),
                )),
        ])
      ],
    );
  }
}
