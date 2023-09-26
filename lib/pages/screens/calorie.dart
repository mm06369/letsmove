import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/calorie/calorie_cubit.dart';
import 'package:fitness_app_ui/pages/components/circular_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../globals.dart';
import '../../logic/cubit/muscle_wiki/select_exercise/calorie/calorie_state.dart';

class Calorie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Calorie Calculator',
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orange)),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.orange)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<CalorieCubit, CalorieState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      fillColor: const MaterialStatePropertyAll(Colors.orange),
                      value: 'imperial',
                      groupValue: state
                          .weightUnit, // You need to set the selected value
                      onChanged: (String? value) {
                        BlocProvider.of<CalorieCubit>(context)
                            .updateWeightUnit(value!);
                      },
                    ),
                    const Text(
                      'Imperial',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: Globals.getDeviceWidth(context) * 0.20,
                    ),
                    Radio(
                      fillColor: const MaterialStatePropertyAll(Colors.orange),
                      value: 'metric',
                      groupValue: state
                          .weightUnit, // You need to set the selected value
                      onChanged: (String? value) {
                        BlocProvider.of<CalorieCubit>(context)
                            .updateWeightUnit(value!);
                        // Handle radio button selection
                      },
                    ),
                    const Text(
                      'Metric',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Container(alignment: Alignment.center, child: const Text('Age')),
            BlocBuilder<CalorieCubit, CalorieState>(
              builder: (context, state) {
                return Slider(
                  // thumbColor: Colors.orange,
                  // overlayColor: const MaterialStatePropertyAll(Colors.orange),
                  activeColor: Colors.orange,
                  inactiveColor: Colors.grey[400],
                  value: state.age!
                      .toDouble(), // You can set the initial value here
                  onChanged: (newValue) {
                    // Handle slider value change
                    BlocProvider.of<CalorieCubit>(context)
                        .updateAge(newValue.toInt());
                  },
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: state.age
                      .toString(), // You can format this based on the current value
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Expanded(child: CircularSlider())
            CircularSlider()
          ],
        ),
      ),
    );
  }
}
