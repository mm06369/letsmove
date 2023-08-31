import 'package:flutter/material.dart';

class ExerciseDropdown extends StatefulWidget {
  final List<String> items;
  final String initialOption;
  ExerciseDropdown({required this.items, required this.initialOption});
  @override
  _ExerciseDropdownState createState() => _ExerciseDropdownState();
}

class _ExerciseDropdownState extends State<ExerciseDropdown> {
  late String _selectedOption;
  late final List<String> items;

  @override
  void initState() {
    items = widget.items;
    _selectedOption = widget.initialOption;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedOption,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.orange, // Orange color
                  ),
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
