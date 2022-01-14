/*
  Not finished.
  CustomScrollView Approach. Facing scroll overlap problem.
  Uses extended_slivers package.
*/

import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter/components/CustomSliverAppBarDelegate.dart';
import 'package:twitter/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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

  @override
  Widget build(BuildContext context) {
    //User? user = userService.getUser("bhavinb98");
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate:
                CustomSliverAppBarDelegate(expandedHeight: 200, avatarURL: ""),
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
                      children: <Widget>[
                        Text(
                          'user.name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@' 'user.userName',
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
                      child: Text(
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
                            BorderSide(style: BorderStyle.solid),
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
                      children: <Widget>[
                        Icon(
                          Icons.bubble_chart,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Born ',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Joined ',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
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
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       return const Text('Child');
          //     },
          //     childCount: 5,
          //   ),
          // ),
          // SliverPersistentHeader(
          //   delegate: CustomSliverTabBarDelegate(tabController: tabController),
          // ),
          // extended_slivers package
          // SliverPinnedToBoxAdapter(
          //   child: TabBar(controller: tabController, tabs: [
          //     Tab(
          //       child: Text(
          //         'Tweets',
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     ),
          //     Tab(
          //       child: Text(
          //         'Likes',
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     ),
          //     Tab(
          //       child: Text(
          //         'Media',
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     )
          //   ]),
          // ),
          // SliverFillRemaining(
          //   child: TabBarView(controller: tabController, children: [
          //     Text(
          //       'Tweets',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     Text(
          //       'Likes',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     Text(
          //       'Media',
          //       style: TextStyle(color: Colors.black),
          //     ),
          //   ]),
          // )
        ],
      ),
    );
  }
}
