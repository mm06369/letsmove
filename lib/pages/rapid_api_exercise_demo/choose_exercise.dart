import 'package:fitness_app_ui/logic/cubit/choose_exercise/exercise_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/choose_exercise/exercise_state.dart';
import 'package:fitness_app_ui/pages/rapid_api_exercise_demo/exercise_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';

class ChooseExercise extends StatefulWidget {
  const ChooseExercise({Key? key}) : super(key: key);

  @override
  State<ChooseExercise> createState() => _ChooseExerciseState();
}

class _ChooseExerciseState extends State<ChooseExercise> {

  void getData() async {
    await BlocProvider.of<ExerciseCubit>(context).getExerciseNames();
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mobileSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "List of Body Parts",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Geometria',
                ),
              ),
              SizedBox(
                height: mobileSize.height * 0.05,
              ),
              ConnectivityBuilder(
                builder: (ConnectivityStatus status){
                  if (status == ConnectivityStatus.online){
                    return BlocBuilder<ExerciseCubit, ExerciseState>(
                  builder: (context, state) {
                    return state.isLoading == false ? Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Column(
                                children: const [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                          itemCount: state.exerciseName!.length,
                          itemBuilder: (context, index) => 
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ExerciseDetail(bodyPartName: state.exerciseName![index],)));

                            },
                            child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ]),
                                  child: Center(
                                      child: Text(
                                    state.exerciseName![index],
                                    style: const TextStyle(
                                        fontFamily: 'Geometria', fontSize: 20),
                                  )),
                                ),
                          )), 
                    ): const Center(child: CircularProgressIndicator(),);
                    
                  },
                );
                
                  }

                  else if (status == ConnectionState.waiting){
                    return const Center(child: Text("No Internet Connection"),);
                  }

                  else if (status == ConnectivityStatus.offline) {
                    return const Center(child: Text("No Internet Connection"),);
                  }
                  
                return Container();
        
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
