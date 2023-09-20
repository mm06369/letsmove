import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_excercise_state.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/select_exercise/select_exercise_cubit.dart';
import 'package:fitness_app_ui/pages/muscle_wiki_concept/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class CustomCard extends StatefulWidget {
  
  const CustomCard({Key? key, required this.name, required this.videoURL}) : super(key: key);
  
  final String name;
  final String videoURL;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  int _imageNum = 0;
  Timer? _timer;
  String name = 'NULL';
  String? videoURL;

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _imageNum = (_imageNum + 1) % 2; // Assuming you have 2 images
      });
    });
  }

  @override
  void initState() {
    name = widget.name;
    videoURL = widget.videoURL;
        // BlocProvider.of<SelectExerciseCubit>(context).addURL(
        // videoURL!);
    super.initState();
    _startAutoPlay();
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
            context, MaterialPageRoute(builder: (_) => DetailPage(name: name,videoURL: videoURL!,)));
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // BlocBuilder<SelectExerciseCubit, SelectExerciseState>(
            //   builder: (context, state) {
            //     return FutureBuilder(
            //       future: state.initializeVideoPlayerFuture,
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.done) {
            //           // If the VideoPlayerController has finished initialization, use
            //           // the data it provides to limit the aspect ratio of the video.
            //           return AspectRatio(
            //             aspectRatio: state.controller!.value.aspectRatio,
            //             // Use the VideoPlayer widget to display the video.
            //             child: VideoPlayer(state.controller!),
            //           );
            //         } else {
            //           // If the VideoPlayerController is still initializing, show a
            //           // loading spinner.
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         }
            //       },
            //     );
            //   },
            // ),
            CarouselSlider(
              items: [
                if (_imageNum == 0)
                  Image.network('https://picsum.photos/400/200',
                      fit: BoxFit.cover),
                if (_imageNum == 1)
                  Image.network('https://picsum.photos/400/200',
                      fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                // autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                height: 200, // Adjust the height as needed
                onPageChanged: (index, reason) {
                  setState(() {
                    _imageNum = index;
                  });
                  // Do something when page changes
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _imageNum = 0;
                      });
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        shape: BoxShape.circle,
                        color: _imageNum == 0 ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _imageNum = 1;
                      });
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        shape: BoxShape.circle,
                        color: _imageNum == 0 ? Colors.white : Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
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
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
