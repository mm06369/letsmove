import 'package:flutter/material.dart';

class RepBtn extends StatefulWidget {
  @override
  _RepBtnState createState() => _RepBtnState();
}

class _RepBtnState extends State<RepBtn> {
  int _selectedBox = -1;

  List<String> boxTexts = [
    'LBS',
    'KG',
  ];

  var tempDict = {
    0: "LBS",
    1: "KG",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            2,
            (index) => _buildBox(index),
          ),
        ),
      ],
    );
  }

  Widget _buildBox(int index) {
    bool isSelected = index == _selectedBox;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBox = index;
        });
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.white54,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 5)
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Center(
            child: Text(
              boxTexts[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
