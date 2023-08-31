import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/calorie/calorie_cubit.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/circular_slider.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/exercise_dropdown.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/height_selector.dart';
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(
                context); // This pops the current screen and goes back
          },
        ),
      ),
      body: BlocBuilder<CalorieCubit, CalorieState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Globals.getDeviceHeight(context) * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CalorieCubit>(context)
                            .updatePageIndex();
                      },
                      child: Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                            color: state.pageIndex == 0
                                ? Colors.orange
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CalorieCubit>(context)
                            .updatePageIndex();
                      },
                      child: Container(
                        width: 60,
                        height: 8,
                        decoration: BoxDecoration(
                            color: state.pageIndex == 1
                                ? Colors.orange
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (state.pageIndex == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        fillColor:
                            const MaterialStatePropertyAll(Colors.orange),
                        value: 'imperial',
                        groupValue: state
                            .weightUnit, // You need to set the selected value
                        onChanged: (String? value) {
                          BlocProvider.of<CalorieCubit>(context)
                              .updateWeightUnit(value!);
                        },
                      ),
                      if (state.pageIndex == 0)
                        const Text(
                          'Imperial',
                          style: TextStyle(fontSize: 17),
                        ),
                      if (state.pageIndex == 0)
                        SizedBox(
                          width: Globals.getDeviceWidth(context) * 0.20,
                        ),
                      if (state.pageIndex == 0)
                        Radio(
                          fillColor:
                              const MaterialStatePropertyAll(Colors.orange),
                          value: 'metric',
                          groupValue: state
                              .weightUnit, // You need to set the selected value
                          onChanged: (String? value) {
                            BlocProvider.of<CalorieCubit>(context)
                                .updateWeightUnit(value!);
                            // Handle radio button selection
                          },
                        ),
                      if (state.pageIndex == 0)
                        const Text(
                          'Metric',
                          style: TextStyle(fontSize: 17),
                        ),
                    ],
                  ),
                if (state.pageIndex == 0) const SizedBox(height: 20),
                if (state.pageIndex == 0)
                  Container(
                      alignment: Alignment.center, child: const Text('Age')),
                if (state.pageIndex == 0)
                  Slider(
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
                  ),
                if (state.pageIndex == 0)
                  const SizedBox(
                    height: 10,
                  ),
                // Expanded(child: CircularSlider())
                if (state.pageIndex == 0) Expanded(child: CircleSlider()),

                if (state.pageIndex == 1)
                  Expanded(
                    child: ListView(
                      children: [
                        HeightPicker(),
                        const SizedBox(
                          height: 20,
                        ),
                        ExerciseDropdown(
                          initialOption: "Little to no exercise",
                          items: const [
                            'Little to no exercise',
                            'Light exercise (1-3 days per week)',
                            'Moderate exercise (3-5 days per week)',
                            'Heavy exercise',
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ExerciseDropdown(
                            initialOption: 'Stay the same weight',
                            items: const [
                              'Lose 2 pounds per week',
                              'Lose 1.5 pounds per week',
                              'Lose 1 pound per week',
                              'Lose 0.5 pounds per week',
                              'Stay the same weight',
                              'Gain 0.5 pounds per week',
                              'Gain 1 pound per week',
                              'Gain 1.5 pounds per week',
                              'Gain 2 pounds per week',
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
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
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CalorieCubit>(context).updatePageIndex();
        },
        backgroundColor: Colors.orange,
        child: BlocBuilder<CalorieCubit, CalorieState>(
          builder: (context, state) {
            return Icon(state.pageIndex == 0
                ? Icons.arrow_right_alt
                : Icons.arrow_back);
          },
        ),
      ),
    );
  }
}
