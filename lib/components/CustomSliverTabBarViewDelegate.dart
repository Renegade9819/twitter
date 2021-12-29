import 'package:flutter/material.dart';

class CustomSliverTabBarViewDelegate extends SliverChildDelegate {
  final TabController tabController;

  const CustomSliverTabBarViewDelegate({required this.tabController});

  @override
  Widget? build(BuildContext context, int index) {
    return TabBarView(controller: tabController, children: const [
      Center(
        child: Text(
          'Tweets',
          style: TextStyle(color: Colors.black),
        ),
      ),
      Center(
        child: Text(
          'Likes',
          style: TextStyle(color: Colors.black),
        ),
      ),
      Center(
        child: Text(
          'Media',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ]);
  }

  @override
  bool shouldRebuild(covariant SliverChildDelegate oldDelegate) {
    return true;
  }
}
