import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final FocusNode focusNode;

  const CustomTextField({Key? key, required this.hintText, required this.textController, required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 227, 255, 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: Colors.purple, style: BorderStyle.solid)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: Colors.purple, style: BorderStyle.solid)),
            hintText: hintText,
            ),
      ),
    );
  }
}
