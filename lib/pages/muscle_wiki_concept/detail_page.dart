import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/detail/detail_cubit.dart';
import 'package:fitness_app_ui/logic/cubit/muscle_wiki/detail/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailCubit>(context).addURL(
        'https://gymvisual.com/modules/productmedia/uploads/73501201preview.mp4');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Machine Leg Extension'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Machine Leg Extension',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
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
            BlocBuilder<DetailCubit, DetailState>(
              builder: (context, state) {
                return FutureBuilder(
                  future: state.initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the VideoPlayerController has finished initialization, use
                      // the data it provides to limit the aspect ratio of the video.
                      return AspectRatio(
                        aspectRatio: state.controller!.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(state.controller!),
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
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
