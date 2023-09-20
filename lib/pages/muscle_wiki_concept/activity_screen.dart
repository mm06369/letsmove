import 'package:flutter/material.dart';

import '../../globals.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({Key? key}) : super(key: key);

  final String day = 'Thursday';
  final List<String> menuOptions = [
    'Delete training',
    'Select activities',
    'Reorder activities',
    'Training setting'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert), // Icon for the button
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rectangle
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0), // Circle
                  ),
                  0.5),
              onSelected: (String result) {},
              itemBuilder: (BuildContext context) => List.generate(
                  menuOptions.length,
                  (index) => PopupMenuItem(
                      value: menuOptions[index],
                      child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            menuOptions[index],
                            style: const TextStyle(fontSize: 12),
                          ))))),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Today',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 22, left: 20),
                alignment: Alignment.centerLeft,
                color: Colors.orange,
                width: Globals.getDeviceWidth(context),
                height: Globals.getDeviceHeight(context) * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$day activities",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            Text(
                              '6 minutes',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.whatshot,
                              color: Colors.white,
                            ),
                            Text(
                              '37 kcal',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: Globals.getDeviceHeight(context) * 0.130,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: ElevatedButton(
              onPressed: () {
                // Add your button click logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.white,
                elevation: 0,
                shape: OutlinedBorder.lerp(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Rectangle
                    ),
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // Circle
                    ),
                    0.5),
                side: const BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.orange, // Icon color
                  ),
                  SizedBox(width: 8.0), // Add spacing between icon and text
                  Text(
                    'Track heart rate',
                    style: TextStyle(
                      color: Colors.orange, // Text color
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 245,
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  title: Text(
                    "Standing split, right",
                    style: TextStyle(),
                  ),
                  subtitle: Row(
                    children: [
                      Text("1 set",
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        color: Colors.orange,
                        size: 14, // Dot color
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "No equipment",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: () {
              // Add your button click logic here
            },
            icon: const Icon(
              Icons.add, // Add icon
              color: Colors.orange, // Icon color (orange)
            ),
            label: const Text(
              'Add Activity',
              style: TextStyle(
                color: Colors.orange, // Text color (orange)
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 80, right: 80),
        child: Container(
          height: 60,
          // alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          width: 200.0,
          // height: 80.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: Colors.orange,
              width: 2.0,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Finish Training',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 2.0),
              Text(
                '0/1 Activities Done',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
