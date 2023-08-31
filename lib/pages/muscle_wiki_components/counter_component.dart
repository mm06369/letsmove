import 'package:flutter/material.dart';

class NumberCounter extends StatefulWidget {
  final int initalValue;
  final int width;
  NumberCounter({required this.initalValue, required this.width});
  @override
  _NumberCounterState createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  int _value = 3000;
  late final int width;

  void _incrementValue() {
    setState(() {
      _value++;
    });
  }

  void _decrementValue() {
    setState(() {
      _value--;
    });
  }

  @override
  void initState() {
    _value = widget.initalValue;
    width = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width.toDouble(),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.orange,
              ),
              onPressed: _decrementValue,
            ),
            const SizedBox(width: 10),
            Text(
              '$_value',
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.orange,
              ),
              onPressed: _incrementValue,
            ),
          ],
        ),
      ),
    );
  }
}
