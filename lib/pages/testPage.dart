import 'package:flutter/material.dart';
import 'package:nationaldex/constants/app_colors.dart';
import 'package:nationaldex/widgets/sliver_bar_search.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
  });

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteBackground,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: CustomScrollView(
            slivers: [
              const SliverBarSearch(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 100,
                  (context, index) {
                    return ListTile(
                      title: Text('Title $index'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
