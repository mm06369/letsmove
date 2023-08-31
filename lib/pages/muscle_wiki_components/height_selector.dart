import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightPicker extends StatefulWidget {
  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  int _selectedFeet = 0; // Default feet value
  int _selectedInches = 0; // Default inches value

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selected Height: $_selectedFeet\' $_selectedInches"',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: SizedBox(
              width: 300,
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: List.generate(8, (index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$index\'',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }),
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedFeet = value;
                  });
                },
              ),
            )),
            Expanded(
                child: SizedBox(
              width: 300,
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: List.generate(12, (index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$index\'',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                }),
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedInches = value;
                  });
                },
              ),
            )),
          ],
        ),
      ],
    ));
  }
}
