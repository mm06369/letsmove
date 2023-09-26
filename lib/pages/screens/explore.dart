

import 'package:fitness_app_ui/pages/components/carousel_item.dart';
import 'package:fitness_app_ui/pages/components/explore_card.dart';
import 'package:fitness_app_ui/pages/components/scrollable_axis.dart';
import 'package:fitness_app_ui/pages/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../globals.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}):super(key: key);

  final categories = [
  {"name" : "Back", "image": "assets/categories/back_image.jpg"}, 
  {"name" : "Calves", "image": "assets/categories/calves.jpg"},
  {"name" : "Cardio", "image": "assets/categories/cardio.jpg"},
  {"name" : "Chest", "image": "assets/categories/chest.jpg"},
  {"name" : "Forearms", "image": "assets/categories/forearms.jpg"},
  {"name" : "Thighs", "image": "assets/categories/thigh.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 4.0, top: 10),
                  child: Text("Explore", style: TextStyle(letterSpacing: 2 ,color: Colors.orange, fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'Poppins', shadows: [BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 5, offset: Offset(2,0))]),),
                ),
                const SizedBox(height: 5,),
                Center(child: ExploreCard()),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Workouts", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
                    TextButton(onPressed: (){} , child: const Text("Show all", style: TextStyle(color: Colors.orange, fontSize: 15),))
                  ],
                ),
                const SizedBox(height: 15,),
                Center(
                  child: SizedBox(
                    height: 200,
                    width: Globals.getDeviceWidth(context),
                    child: FlutterCarousel.builder(itemCount: categories.length, itemBuilder: ((context, index, realIndex) {
                      return CarouselItem(imageURL: categories[index]["image"]!, titleText: categories[index]["name"]!);
                    }), options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true
                    )),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Activities", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
                    } , child: const Text("Show all", style: TextStyle(color: Colors.orange, fontSize: 15),))
                  ],
                ),
                const SizedBox(height: 10,),
                HorizontalScrollableAxis()
              ],
            ),
          ),
        ),
      ),
    );
  }
}