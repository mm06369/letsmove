import 'package:fitness_app_ui/pages/exercises/components/button_row.dart';
import 'package:fitness_app_ui/pages/exercises/components/level_button.dart';
import 'package:flutter/material.dart';

import 'exercise_detail.dart';

class SelectLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LevelButton(title: "Beginner"),
                    LevelButton(title: 'Amateur'),
                    LevelButton(title: "Expert")
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 280,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter the body part name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20.0),
                          ),
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                          ),
                        )),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          // Add your onPressed logic here
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonRow(),
                const SizedBox(
                  height: 30,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
