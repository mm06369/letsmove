


import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

// class SchedulePage extends StatelessWidget {
//   const SchedulePage({Key? key}):super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [

//           ],
//         ),
//       ),
//     );
//   }
// }

class GymClass {
  final String title;
  final String instructor;
  final String date;
  final String time;
  bool isBooked;

  GymClass({
    required this.title,
    required this.instructor,
    required this.date,
    required this.time,
    this.isBooked = false,
  });
}

class GymClassPage extends StatefulWidget {
  @override
  _GymClassPageState createState() => _GymClassPageState();
}

class _GymClassPageState extends State<GymClassPage> {
  List<GymClass> classes = [
    GymClass(
      title: 'Cardio Blast',
      instructor: 'John Doe',
      date: 'August 25, 2023',
      time: '9:00 AM',
    ),
    GymClass(
      title: 'HIIT Training',
      instructor: 'Jane Smith',
      date: 'August 26, 2023',
      time: '6:00 PM',
    ),
    // Add more classes here
  ];

  void bookClass(int index) {
    setState(() {
      classes[index].isBooked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Text('Gym Class Booking', style:  TextStyle(
                  fontSize: 22,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),),
              const SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final gymClass = classes[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(gymClass.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Instructor: ${gymClass.instructor}'),
                              Text('Date: ${gymClass.date}'),
                              Text('Time: ${gymClass.time}'),
                            ],
                          ),
                          trailing: gymClass.isBooked
                              ? Text('Booked')
                              : Container(
                                decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 151, 73, 230),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                                child: MaterialButton(
                                    onPressed: () => bookClass(index),
                                    child: Text('Book Now'),
                                  ),
                              ),
                        ),
                        const SizedBox(height: 10,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}