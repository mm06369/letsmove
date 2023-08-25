

import 'package:flutter/material.dart';

class BMIWidget extends StatelessWidget {
  const BMIWidget({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 227, 255, 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Your BMI: ',
                        style: TextStyle(
                          color: Color.fromRGBO(190, 130, 255, 1.0),
                          fontSize: 18.0,
                        ),
                      ),
                     Text("1.2")
                    ],
                  ),
                
              );
  }
}