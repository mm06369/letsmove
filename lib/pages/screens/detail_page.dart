import 'package:fitness_app_ui/logic/cubit/muscle_wiki/activity/activity_cubit.dart';
import 'package:fitness_app_ui/models/exercise_model.dart';
import 'package:fitness_app_ui/pages/components/bottom_nav.dart';
import 'package:fitness_app_ui/pages/screens/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../globals.dart';
import '../../models/activity_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.exercise}) : super(key: key);

  // final String videoURL;
  // final String name;
  final ExerciseModel exercise;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // String? videoURL;
  ExerciseModel? exercise = ExerciseModel();
  Future<void>? initializeVideoPlayerFuture;
  var controller;

  @override
  void initState() {
    // videoURL = widget.videoURL;
    exercise = widget.exercise;
    controller = VideoPlayerController.networkUrl(
      Uri.parse(
        exercise!.url!,
      ),
    );
    initializeVideoPlayerFuture = controller.initialize();
    controller.setLooping(true);
    controller.play();

    super.initState();
  }

  @override
  void dispose() {
    controller.pause();
    controller.dispose();
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(exercise!.exerciseName!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    exercise!.exerciseName!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 8),
                    Icon(Icons.notes),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Wrap(
              spacing: 4,
              children: [
                Chip(label: Text('Intermediate')),
                Chip(label: Text('Machine')),
                Chip(label: Text('Isolation')),
              ],
            ),
            const SizedBox(height: 16),
            FutureBuilder(
              future: initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(controller!),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            const _BubbleContainer(
              order: 1,
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            const SizedBox(height: 16),
            const _BubbleContainer(
              order: 2,
              content:
                  'Pellentesque eget ex viverra, tempor velit nec, facilisis justo.',
            ),
            const SizedBox(height: 16),
            Table(border: TableBorder.all(), children: const [
              TableRow(
                decoration: BoxDecoration(),
                children: [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Muscles')),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Quads')),
                  )),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(),
                children: [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Difficulty')),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Intermediate')),
                  )),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(),
                children: [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Category')),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Machine')),
                  )),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(),
                children: [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Grips')),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('None')),
                  )),
                ],
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Globals.getDeviceWidth(context) * 0.8,
              child: ElevatedButton(
                onPressed: () {
                                BlocProvider.of<ActivityCubit>(context).addToActivities(Activity(
                  name: exercise!.exerciseName,
                  equipment: exercise!.equipment,
                  bodyPart: exercise!.bodyPart,
                  url: exercise!.url,
                  numSets: 1,
                ));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BottomNavigation(index: 2,)));
                  // Add your button click logic here
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  primary: Colors.orange, // Button color
                  padding:
                      const EdgeInsets.all(16.0), // Padding around the button
                ),
                child: const Text(
                  'Add to today',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: 50.0, // Adjust the size as needed
                height: 50.0, // Adjust the size as needed
                decoration: const BoxDecoration(
                  color: Colors.orange, // Button background color
                  shape: BoxShape.circle, // Circular shape
                ),
                child: const Center(
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white, // Calendar icon color
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BubbleContainer extends StatelessWidget {
  final int order;
  final String content;

  const _BubbleContainer({required this.order, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: Center(
              child: Text(
            order.toString(),
            style: const TextStyle(color: Colors.white),
          )),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(content)),
      ],
    );
  }
}
