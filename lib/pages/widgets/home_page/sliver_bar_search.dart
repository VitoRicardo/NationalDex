import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/bloc/pokemon_bloc.dart';
import 'package:nationaldex/bloc/pokemon_event.dart';

class SliverBarSearch extends StatelessWidget {
  final PokemonBloc bloc;
  const SliverBarSearch({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 130,
      backgroundColor: AppColor.whiteBackground,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NationalDex',
              style: TextStyle(
                fontSize: 30,
                color: AppColor.redBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Search for a Pokemon by his full or partial name',
              style: TextStyle(
                fontSize: 15,
                color: AppColor.headTextDescription,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: MinimizeSearch(
          bloc: bloc,
        ),
      ),
    );
  }
}

class MinimizeSearch extends StatefulWidget {
  final PokemonBloc bloc;
  const MinimizeSearch({Key? key, required this.bloc}) : super(key: key);

  @override
  State<MinimizeSearch> createState() => _MinimizeSearchState();
}

class _MinimizeSearchState extends State<MinimizeSearch> {
  @override
  void dispose() {
    widget.bloc.inputPokemonController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColor.redBackground,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: AppColor.searchField,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppColor.filterIcon,
              ),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: AppColor.searchField),
              ),
            ),
            onChanged: (value) {
              setState(() {
                widget.bloc.inputPokemonController.add(
                  PokemonSearchEvent(name: value),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
