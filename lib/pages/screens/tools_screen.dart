import 'package:fitness_app_ui/pages/screens/calorie.dart';
import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tools',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomButton(
              icon: Icons.favorite,
              text: 'Favorites',
              onPressed: () {
                // Handle button press
              },
            ),
            CustomButton(
              icon: Icons.fireplace,
              text: 'Calorie Calculator',
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Calorie()));
                // Handle button press
              },
            ),
            CustomButton(
              icon: Icons.monitor_weight,
              text: 'Macro Calculator',
              onPressed: () {
                // Handle button press
              },
            ),
            CustomButton(
              icon: Icons.calculate,
              text: 'One Rep Max Calculator',
              onPressed: () {
                // Handle button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  CustomButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.orange,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
