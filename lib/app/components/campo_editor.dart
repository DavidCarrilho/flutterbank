import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final dica;
  final IconData icon;

  const Editor({
    this.controller,
    this.label,
    this.dica,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: label,
          hintText: dica,
          icon: Icon(icon),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}