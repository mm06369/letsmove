import 'package:fitness_app_ui/pages/schedule_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20,),
                Text("Gym Menu", style:  TextStyle(
                      fontSize: 22,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700,
                    ),),
                    const SizedBox(height: 30,),
                MenuButton(
                  title: 'Check Gym Schedule',
                  onPressed: () {
                    Navigator.push((context), MaterialPageRoute(builder: (_) => GymClassPage()));
                  },
                ),
                MenuButton(
                  title: 'Gadgets',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                MenuButton(
                  title: 'Health Monitor',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                MenuButton(
                  title: 'Find Instructor',
                  onPressed: () {
                    // Handle button press
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  MenuButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 151, 73, 230),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}