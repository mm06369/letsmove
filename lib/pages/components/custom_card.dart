import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/pages/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../models/exercise_model.dart';

class CustomCard extends StatefulWidget {
  
  const CustomCard({Key? key, required this.exercise}) : super(key: key);
  
  final ExerciseModel exercise;
  // final String name;
  // final String videoURL;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Timer? _timer;
  // String name = 'NULL';
  // String? videoURL;
  ExerciseModel? exercise = ExerciseModel();


  @override
  void initState() {
    // name = widget.name;
    // videoURL = widget.videoURL;
    exercise = widget.exercise;
    super.initState();
 
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => DetailPage(exercise: exercise!,)));
      },
      child: Card(
        shape: ShapeBorder.lerp(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ), RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 0.5),
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
 
            CarouselSlider(
              items: [
                  Image.asset("assets/categories/barbellcurl.jpg", fit: BoxFit.cover,),
                  Image.asset("assets/categories/battlingropes.jpg", fit: BoxFit.cover,),
              ],
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                height: 200, 
                onPageChanged: (index, reason) {
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                exercise!.exerciseName!,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Tag('Intermediate'),
                  Tag('Machine'),
                  Tag('Isolation'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;

  Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      ),
    );
  }
}
