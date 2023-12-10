import 'package:flutter/material.dart';

class RowInput extends StatelessWidget {
  final String hintText;

  const RowInput({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.35),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
