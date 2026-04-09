import 'package:flutter/material.dart';

class Timestamp extends StatelessWidget {
  final String timestamp;

  const Timestamp({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Text(
      timestamp,
      style: const TextStyle(fontSize: 10, color: Colors.grey),
    );
  }
}
