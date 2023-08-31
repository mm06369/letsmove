import 'package:fitness_app_ui/logic/cubit/muscle_wiki/macro/macro_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/macro/macro_state.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/counter_component.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_components/macro_box.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_concept/calorie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../globals.dart';
import '../../logic/cubit/muscle_wiki/select_exercise/calorie/calorie_cubit.dart';

class Macro extends StatelessWidget {
  const Macro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Macro Calculator',
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
      body: BlocBuilder<MacroCubit, MacroState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<MacroCubit>(context).updatePageIndex();
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
                        BlocProvider.of<MacroCubit>(context).updatePageIndex();
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
                const SizedBox(
                  height: 30,
                ),
                if (state.pageIndex == 0) CustomBoxComponent(),
                if (state.pageIndex == 1)
                  Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text('Calories')),
                if (state.pageIndex == 1)
                  NumberCounter(
                    initalValue: 3000,
                    width: 200,
                  ),
                if (state.pageIndex == 1)
                  const SizedBox(
                    height: 20,
                  ),
                if (state.pageIndex == 1)
                  Center(
                    child: SizedBox(
                      width: Globals.getDeviceWidth(context) * 0.80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Calorie()));
                          // Add your onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // White background
                          onPrimary: Colors.black, // Black text color
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Find my daily needs',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (state.pageIndex == 1)
                  const SizedBox(
                    height: 20,
                  ),
                if (state.pageIndex == 1)
                  Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: const Text("Meals per day:")),
                if (state.pageIndex == 1)
                  NumberCounter(
                    initalValue: 6,
                    width: 180,
                  ),
                if (state.pageIndex == 1)
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
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          BlocProvider.of<MacroCubit>(context).updatePageIndex();
        },
        child: BlocBuilder<MacroCubit, MacroState>(
          builder: (context, state) {
            return Icon(
                state.pageIndex == 0 ? Icons.arrow_forward : Icons.arrow_back);
          },
        ),
      ),
    );
  }
}
