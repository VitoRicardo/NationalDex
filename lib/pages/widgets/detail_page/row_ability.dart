import 'package:flutter/material.dart';

class RowAbility extends StatelessWidget {
  final List<Map<String, dynamic>> abilities;
  const RowAbility({Key? key, required this.abilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (Map<String, dynamic> ability in abilities)
          Container(
            child: Text(
              '${(ability['ability'] as String)[0].toUpperCase()}'
              '${(ability['ability'] as String).substring(1)} '
              '${ability['is_hidden'] == true ? '(Hidden)' : ''}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }
}
