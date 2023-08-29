import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
           Text(
              'More',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            MoreButton(text: 'Sign In'),
            SizedBox(
              height: 20,
            ),
           Text(
              "Others",
              style: TextStyle(fontSize: 20),
            ),
            MoreButton(text: 'Support'),
            MoreButton(text: 'Eula'),
            MoreButton(text: 'Privacy'),
            MoreButton(text: 'Disclaimer'),
            MoreButton(text: 'Copyright'),
          ],
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  final String text;

  const MoreButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
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
        onPressed: () {
          // Handle button press
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.grey[700]),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
