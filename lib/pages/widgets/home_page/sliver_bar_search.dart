import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';

class SliverBarSearch extends StatelessWidget {
  const SliverBarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 170,
      backgroundColor: AppColor.whiteBackground,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NationalDex',
              style: TextStyle(
                fontSize: 30,
                color: AppColor.headText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Search for a Pokemon by name or using its National Pokedex number',
              style: TextStyle(
                fontSize: 15,
                color: AppColor.headTextDescription,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: MinimizeSearch(),
      ),
    );
  }
}

class MinimizeSearch extends StatelessWidget {
  const MinimizeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColor.redBackground,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: AppColor.searchField,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppColor.filterButton,
              ),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: AppColor.searchField),
              ),
            ),
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: AppColor.filterButton,
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {},
            child: Icon(
              Icons.tune,
              color: AppColor.whiteBackground,
            ),
          ),
        )
      ],
    );
  }
}
