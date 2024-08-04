import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      required this.backgroundColor});

  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        widget.icon,
        color: Colors.white,
      ),
      onPressed: widget.onPressed,
      label: Text(
        widget.text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
      ),
    );
  }
}
