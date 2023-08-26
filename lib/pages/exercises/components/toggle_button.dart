import 'dart:ffi';

import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback update;
  final VoidCallback remove;

  const ToggleButton({Key? key, required this.update, required this.remove})
      : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late final VoidCallback update;
  late final VoidCallback remove;

  bool isOn = false;

  void toggle() {
    setState(() {
      isOn = !isOn;
    });
    if (isOn) {
      update();
    } else {
      remove();
    }
  }

  @override
  void initState() {
    update = widget.update;
    remove = widget.remove;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: 30.0,
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.5),
          color: isOn ? Colors.orange : Colors.white,
          border: Border.all(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOn ? Colors.white : Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
