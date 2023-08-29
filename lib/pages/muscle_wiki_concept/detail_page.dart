import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Machine Leg Extension',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(Icons.star),
                    SizedBox(width: 8),
                    Icon(Icons.notes),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              children: const [
                Chip(label: Text('Intermediate')),
                Chip(label: Text('Machine')),
                Chip(label: Text('Isolation')),
              ],
            ),
            const SizedBox(height: 16),
            CarouselSlider(
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
              ),
              items: [
                Image.network('https://picsum.photos/400/200'),
                Image.network('https://picsum.photos/400/200'),
              ],
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
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
