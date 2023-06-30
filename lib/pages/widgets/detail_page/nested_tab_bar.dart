import 'package:flutter/material.dart';
import 'nested_tab_components/defense_vulnerability.dart';
import 'nested_tab_components/stats_bar.dart';

class NestedTabBar extends StatefulWidget {
  final Map<String, int> statsPokemon;
  final Map<String, double> defenseVulnerability;

  final int id;
  final double height;
  final double weight;

  const NestedTabBar({
    super.key,
    required this.statsPokemon,
    required this.defenseVulnerability,
    required this.id,
    required this.height,
    required this.weight,
  });

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: TabBar(
            labelColor: Colors.black,
            controller: _tabController,
            dividerColor: Colors.transparent,
            tabs: const <Widget>[
              Tab(
                text: 'Stats',
              ),
              Tab(
                text: 'Weakness',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: 6,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final keys = widget.statsPokemon.keys.toList();
                    final values = widget.statsPokemon.values.toList();
                    return StatsBar(
                        stat:
                            '${keys[index][0].toUpperCase()}${keys[index].substring(1)}',
                        currentValue: values[index]);
                  },
                ),
              ),
              DefenseVulnerability(
                typeRelation: widget.defenseVulnerability,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
