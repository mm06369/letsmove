import 'package:flutter/material.dart';

class LevelButton extends StatefulWidget {
  final String title;
  LevelButton({required this.title});

  @override
  State<LevelButton> createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  late final String title;
  bool? isPressed = false;

  @override
  void initState() {
    title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          color: isPressed == false ? Colors.orange : Colors.deepOrange,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            isPressed! ? isPressed = false : isPressed = true;
          });
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
