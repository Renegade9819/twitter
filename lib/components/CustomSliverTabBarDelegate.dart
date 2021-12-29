import 'package:flutter/material.dart';

class CustomSliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;

  CustomSliverTabBarDelegate({required this.tabController});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        TabBar(controller: tabController, tabs: [
          Tab(
            child: Text(
              'Tweets',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              'Likes',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              'Media',
              style: TextStyle(color: Colors.black),
            ),
          )
        ]),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            Text(
              'Tweets',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Likes',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Media',
              style: TextStyle(color: Colors.black),
            ),
          ]),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
