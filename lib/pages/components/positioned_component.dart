

import 'package:flutter/material.dart';

import '../../globals.dart';

class PositionedComponent extends StatelessWidget {

  double top;
  double right;
  double bottom;
  double left;
  Color colr;
  void Function() onTap;


  PositionedComponent({Key? key, this.top = 0, this.right = 0, this.bottom = 0 , this.left = 0, required this.onTap, this.colr = Colors.transparent}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: top,
              right: right,
              bottom: bottom,
              left: left,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 10,
                  height: 10,
                  color: colr,
                ),
              ),
            );
  }
}