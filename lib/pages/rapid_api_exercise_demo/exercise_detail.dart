import 'package:fitness_app_ui/logic/cubit/exercise_detail/excise_detail_state.dart';
import 'package:fitness_app_ui/logic/cubit/exercise_detail/exercise_detail_cubit.dart';
import 'package:fitness_app_ui/pages/rapid_api_exercise_demo/components/check_box_exercise_tile.dart';
import 'package:fitness_app_ui/pages/rapid_api_exercise_demo/select_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseDetail extends StatefulWidget {
  final String? bodyPartName;

  ExerciseDetail({required this.bodyPartName});

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  late final String? bodyPartName;

  void getData(String bodyPartName) async {
    await BlocProvider.of<ExerciseDetailCubit>(context)
        .getExerciseDetail(bodyPartName);
  }

  @override
  void initState() {
    bodyPartName = widget.bodyPartName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData(bodyPartName!);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Body Part: ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Geometria')),
                TextSpan(
                    text: widget.bodyPartName,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontFamily: 'Geometria'))
              ])),
              const SizedBox(
                height: 30,
              ),
              const Text("Select the exercises you want to do: "),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<ExerciseDetailCubit, ExerciseDetailState>(
                  builder: (context, state) {
                    return state.isLoading == false
                        ? ListView.separated(
                            separatorBuilder: (context, index) => Column(
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                            itemCount: state.excersiceDetailList!.length,
                            itemBuilder: (context, index) {
                              return CheckBoxExerciseTile(
                                equipment: state
                                    .excersiceDetailList![index].equipment!,
                                name: state.excersiceDetailList![index].name!,
                                targets:
                                    state.excersiceDetailList![index].target!,
                                id: state.excersiceDetailList![index].id!,
                                gifUrl:
                                    state.excersiceDetailList![index].gifUrl!,
                              );
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          BlocProvider.of<ExerciseDetailCubit>(context).getExercises();
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SelectExercise()));
          // Add your onPressed logic here
        },
        height: 50.0,
        minWidth: double.infinity,
        color: Colors.orange,
        textColor: Colors.white,
        child: const Text(
          'Proceed',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
