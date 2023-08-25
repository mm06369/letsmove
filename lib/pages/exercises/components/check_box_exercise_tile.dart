import 'package:fitness_app_ui/logic/cubit/exercise_detail/exercise_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/exercise_model.dart';

class CheckBoxExerciseTile extends StatefulWidget {
  final String equipment;
  final String name;
  final String targets;
  final String? gifUrl;
  final String? id;

  CheckBoxExerciseTile(
      {required this.equipment,
      required this.name,
      required this.targets,
      required this.gifUrl,
      required this.id});

  @override
  State<CheckBoxExerciseTile> createState() => _CheckBoxExerciseTileState();
}

class _CheckBoxExerciseTileState extends State<CheckBoxExerciseTile> {
  late final String equipment;
  late final String name;
  late final String targets;
  late final String? gifUrl;
  late final String? id;
  bool _isChecked = false;

  @override
  void initState() {
    equipment = widget.equipment;
    name = widget.name;
    targets = widget.targets;
    gifUrl = widget.gifUrl;
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.all<Color>(Colors.purple),
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue!;
                });
                if (_isChecked == true) {
                  BlocProvider.of<ExerciseDetailCubit>(context).addExercises(
                      ExerciseModel(
                          equipment: equipment,
                          gifUrl: gifUrl,
                          id: id,
                          name: name,
                          target: targets));
                }
                if (_isChecked == false) {
                  BlocProvider.of<ExerciseDetailCubit>(context).removeExercises(
                      ExerciseModel(
                          equipment: equipment,
                          gifUrl: gifUrl,
                          id: id,
                          name: name,
                          target: targets));
                }
              },
            ),
            SizedBox(
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Equipment: $equipment",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text("Exercise Name: $name",
                      style: const TextStyle(fontSize: 12)),
                  Text("Targets part of body: $targets",
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
