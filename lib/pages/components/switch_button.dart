import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final void Function(String) onChanged;

  const SwitchButton({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isMale = true;
  late final void Function(String) onChanged;

  void _toggleGender() {
    setState(() {
      isMale = !isMale;
    });
    isMale ? onChanged("male") : onChanged("female");
  }

  @override
  void initState() {
    onChanged = widget.onChanged;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleGender,
      child: Container(
        width: 120.0,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.orange, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.person,
              color: Colors.orange,
            ),
            Text(
              isMale ? 'Male' : 'Female',
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
