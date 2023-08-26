

import 'package:flutter/material.dart';

class BMIWidget extends StatelessWidget {
  const BMIWidget({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 227, 255, 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const  <Widget>[
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