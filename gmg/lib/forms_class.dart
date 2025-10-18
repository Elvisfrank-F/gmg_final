import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  final String text;
  final AssetImage image;
  final double width;
  final double height;

  const Forms({
    super.key,
    required this.text,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text ?? "NULL",
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(image: DecorationImage(image: image)),
          ),
        ],
      ),
    );
  }
}
