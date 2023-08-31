import 'package:fitness_app_ui/logic/cubit/muscle_wiki/macro/macro_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBoxComponent extends StatefulWidget {
  @override
  _CustomBoxComponentState createState() => _CustomBoxComponentState();
}

class _CustomBoxComponentState extends State<CustomBoxComponent> {
  int _selectedBox = -1;

  List<String> boxTexts = [
    '60/25/15 (High Carb)',
    '50/30/20 (Moderate)',
    '40/30/30 (Zone Diet)',
    '25/45/30 (Low Carb)',
  ];

  var tempDict = {
    0: "High Carb",
    1: "Moderate",
    2: "Zone Diet",
    3: "Low Carb",
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
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            2,
            (index) => _buildBox(index + 2),
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
        BlocProvider.of<MacroCubit>(context)
            .updateBoxSelected(tempDict[index]!);
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
