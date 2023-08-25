import 'package:flutter/material.dart';

class ShowExcercise extends StatelessWidget {
  final String gifUrl;
  final String excersiceName;
  ShowExcercise({Key? key, required this.gifUrl, required this.excersiceName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text("Exercise Name: $excersiceName"),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Image.network(gifUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Text(
                        "Showing the illustration in a second, sit tight!");
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
