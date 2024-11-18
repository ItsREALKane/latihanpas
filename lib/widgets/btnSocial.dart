import 'package:flutter/material.dart';

Widget btnSocial({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return IconButton(
    icon: Icon(icon),
    onPressed: onTap,
    color: Color.fromARGB(255, 89, 33, 243),
    iconSize: 30,
  );
}
