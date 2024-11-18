import 'package:flutter/material.dart';

class BtnLogin extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BtnLogin({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: Color.fromARGB(255, 89, 33, 243),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
} 