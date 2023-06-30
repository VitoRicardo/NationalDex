import 'package:flutter/material.dart';

class PokeCharacteristic extends StatelessWidget {
  final String value;
  final String characteristic;
  const PokeCharacteristic(
      {Key? key, required this.value, required this.characteristic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: characteristic,
            style: const TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
