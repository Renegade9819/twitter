/*
  Not finished.
  NestedScrollView Approach. Facing the same scroll overlap problem.
  Uses extended_slivers package.
*/

import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twitter/components/CustomSliverAppBarDelegate.dart';
import 'package:twitter/components/tweet_card.dart';
import 'package:twitter/models/user.dart';

class AnotherProfileScreen extends StatefulWidget {
  const AnotherProfileScreen({Key? key}) : super(key: key);

  @override
  _AnotherProfileScreenState createState() => _AnotherProfileScreenState();
}

class _AnotherProfileScreenState extends State<AnotherProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  //UserService userService = UserService.instance;
  @override
  Widget build(BuildContext context) {
    // User? user = userService.getUser("batman010");
    // print(user!.userName);
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(
                  expandedHeight: 200, avatarURL: null),
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
                            'Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@Handle',
                            style: const TextStyle(
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
                        children: <Widget>[
                          const Icon(
                            Icons.bubble_chart,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Born ' +
                                DateFormat.yMMMd()
                                    .format('user!.dob' as DateTime),
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.black54,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Joined ' +
                                DateFormat.yMMMd()
                                    .format('user.joinDate' as DateTime),
                            style: const TextStyle(fontWeight: FontWeight.w300),
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
        body: TabBarView(controller: tabController, children: [
          // ListView.builder(
          //   itemCount: user!.usertweets.length,
          //   itemBuilder: (context, index) {
          //     print(user.usertweets.elementAt(index).userName);
          //     return TweetCard(
          //       tweet: user.usertweets.elementAt(index),
          //       likedTweetsList: false,
          //     );
          //   },
          // ),
          // ListView.builder(
          //   itemCount: user.likedTweets.length,
          //   itemBuilder: (context, index) {
          //     return TweetCard(
          //       tweet: user.likedTweets.elementAt(index),
          //       likedTweetsList: true,
          //     );
          //   },
          // ),
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
