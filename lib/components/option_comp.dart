import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String option;

  Option(this.option, {Key? key}) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 240,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 3, color: Colors.blue),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option, // Removed unnecessary interpolation
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Radio<String>(
                  value: option,
                  groupValue: "groupValue", // You can replace with actual value
                  onChanged: (val) {
                    // Add logic for handling selection
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
