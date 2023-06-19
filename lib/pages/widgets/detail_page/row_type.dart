import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';

class RowType extends StatelessWidget {
  final List<String> types;
  const RowType({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (String type in types)
          Card(
            color: AppColor.typeColor[type],
            child: SizedBox(
              height: 30,
              width: 100,
              child: Center(
                child: Text(
                  '${type[0].toUpperCase()}'
                  '${type.substring(1)}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
      ],
    );
  }
}
