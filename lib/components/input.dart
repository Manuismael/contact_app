import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String ? name;
  Input({super.key, required this.controller, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
        ),
      ),
    );
  }
}
