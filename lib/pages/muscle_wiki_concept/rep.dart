import 'package:fitness_app_ui/pages/muscle_wiki_components/counter_component.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/progress_indicator.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/rep_box_btn.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';

class Rep extends StatelessWidget {
  const Rep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "One Rep Max Calculator",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Units: ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              RepBtn(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Number of reps:"),
                      const SizedBox(
                        height: 5,
                      ),
                      NumberCounter(
                        initalValue: 0,
                        width: 160,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Weight Lifted:"),
                      const SizedBox(
                        height: 5,
                      ),
                      NumberCounter(
                        initalValue: 0,
                        width: 160,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    width: Globals.getDeviceWidth(context) * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.orange, // Orange border color
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.orange, // Orange text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Your one rep max is:',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '0 LBS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CircularProgressPercentageExample(),
              CircularProgressPercentageExample(),
              CircularProgressPercentageExample(),
              CircularProgressPercentageExample(),
            ],
          ),
        ),
      ),
    );
  }
}
