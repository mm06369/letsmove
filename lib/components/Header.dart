import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  final String title;
  final Widget? rightSide;

  const Header(this.title, {Key? key, this.rightSide}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          
          margin: const EdgeInsets.only(left: 20.0),
          height: 54.0,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 28,
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        (rightSide != null) ? rightSide! : Container()
      ],
    );
  }
}
