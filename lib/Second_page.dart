import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 200,
              child: Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
