/*
  Not finished.
  NestedScrollView Approach. Facing the same scroll overlap problem.
  Uses extended_slivers package.
*/

import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:twitter/components/CustomSliverAppBarDelegate.dart';

class AnotherProfileScreen extends StatefulWidget {
  const AnotherProfileScreen({Key? key}) : super(key: key);

  @override
  _AnotherProfileScreenState createState() => _AnotherProfileScreenState();
}

class _AnotherProfileScreenState extends State<AnotherProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@username',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            overlayColor:
                                MaterialStateProperty.all(Colors.black26),
                            side: MaterialStateProperty.all(
                              const BorderSide(style: BorderStyle.solid),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.bubble_chart,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Born September 2, 1998',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Joined December 2021',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            // extended_slivers package
            SliverPinnedToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Material(
                  type: MaterialType.transparency,
                  child: TabBar(controller: tabController, tabs: const [
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
                ),
              ),
            ),
          ];
        },
        body: TabBarView(controller: tabController, children: const [
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
    );
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
