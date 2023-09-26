import 'package:fitness_app_ui/pages/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../globals.dart';
import '../../logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';


class CarouselItem extends StatelessWidget {

  final String imageURL;
  final String titleText;

  const CarouselItem({Key? key, required this.imageURL, required this.titleText}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<SelectExerciseCubit>(context).updateSelectedExercise('Any', titleText);
        Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0), // Circular border
        child: SizedBox(
          width: Globals.getDeviceWidth(context) * 0.80,
          height: 200,
          child: Stack(
            children: [
              // Image with Opacity Filter
              Container(
                width: Globals.getDeviceWidth(context) * 0.80,
                height: 200.0, // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageURL), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                child: Opacity(
                  opacity: 0.5, // Adjust the opacity level
                  child: Container(
                    color: Colors.black, // Color for the opacity filter
                  ),
                ),
              ),
              Positioned(
                top: 0.0, 
                left: 0.0, 
                bottom: 0.0,
                right: 0.0,
                child: Center(
                  child: Text(
                    titleText,
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 24.0, 
                      fontWeight: FontWeight.w600, 
                      fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}