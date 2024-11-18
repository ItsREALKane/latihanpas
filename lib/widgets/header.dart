import 'package:flutter/material.dart';

Widget HeaderTeam({required String title, required Widget content}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 89, 33, 243),
        ),
      ),
      SizedBox(height: 12),
      content,
      SizedBox(height: 24),
    ],
  );
}