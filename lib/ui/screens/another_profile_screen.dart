import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:twitter/core/models/tweet.dart';
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/providers/tweet_provider.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/core/services/service_locator.dart';
import 'package:twitter/core/services/tweet_service_api.dart';
import 'package:twitter/core/services/user_service_api.dart';
import 'package:twitter/ui/widgets/CustomSliverAppBarDelegate.dart';
import 'package:twitter/ui/widgets/tweet_card.dart';

class AnotherProfileScreen extends StatefulWidget {
  const AnotherProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AnotherProfileScreenState createState() => _AnotherProfileScreenState();
}

class _AnotherProfileScreenState extends State<AnotherProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  UserServiceAPI userServiceWeb = serviceLocator<UserServiceAPI>();
  final TweetServiceAPI tweetServiceWeb = serviceLocator<TweetServiceAPI>();

  late User currentUser;
  late User passedUser;
  late bool isLoggedInUser;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    passedUser = ModalRoute.of(context)!.settings.arguments as User;
    User loggedInUser = Provider.of<UserProvider>(context).loggedInUser;

    if (loggedInUser.userName == passedUser.userName) {
      currentUser = loggedInUser;
      isLoggedInUser = true;
    } else {
      currentUser = passedUser;
      isLoggedInUser = false;
    }
    getUserTweets();
    getUserLikedTweets();
    getUserMediaTweets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(
                expandedHeight: 200,
                avatarId: currentUser.avatarId,
                bgId: currentUser.bgId,
              ),
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
                            currentUser.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '@' + currentUser.userName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    isLoggedInUser
                        ? Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/editProfile',
                                    arguments: currentUser);
                              },
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
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
                                DateFormat.yMMMd().format(currentUser.dob),
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
                                DateFormat.yMMMd().format(currentUser.joinDate),
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
        body: TabBarView(
          controller: tabController,
          children: [
            Consumer<TweetProvider>(builder: (context, tweets, child) {
              return tweets.userTweets.isNotEmpty
                  ? ListView.builder(
                      itemCount: tweets.userTweets.length,
                      itemBuilder: (context, index) {
                        int key = tweets.userTweets.keys.elementAt(index);
                        return TweetCard(
                          tweet: tweets.userTweets[key]!,
                        );
                      },
                    )
                  : Container();
            }),
            Consumer<TweetProvider>(builder: (context, tweets, child) {
              return tweets.likedTweets.isNotEmpty
                  ? ListView.builder(
                      itemCount: tweets.likedTweets.length,
                      itemBuilder: (context, index) {
                        int key = tweets.userTweets.keys.elementAt(index);
                        return TweetCard(
                          tweet: tweets.likedTweets[key]!,
                        );
                      },
                    )
                  : Container();
            }),
            Consumer<TweetProvider>(builder: (context, tweets, child) {
              return tweets.userMediaTweets.isNotEmpty
                  ? ListView.builder(
                      itemCount: tweets.userMediaTweets.length,
                      itemBuilder: (context, index) {
                        int key = tweets.userMediaTweets.keys.elementAt(index);
                        return TweetCard(
                          tweet: tweets.userMediaTweets[key]!,
                        );
                      },
                    )
                  : Container();
            }),
          ],
        ),
      ),
    );
  }

  getUserTweets() async {
    List<Tweet> userTweets =
        await tweetServiceWeb.getUserTweets(currentUser.userName);
    Provider.of<TweetProvider>(context, listen: false)
        .updateUserTweetsList(userTweets);
  }

  getUserLikedTweets() async {
    List<Tweet> userLikedTweets =
        await tweetServiceWeb.getUserLikedTweets(currentUser.userName);
    Provider.of<TweetProvider>(context, listen: false)
        .updateUserLikedTweetsList(userLikedTweets);
  }

  getUserMediaTweets() async {
    List<Tweet> userMediaTweets =
        await tweetServiceWeb.getUserMediaTweets(currentUser.userName);
    Provider.of<TweetProvider>(context, listen: false)
        .updateUserMediaTweetList(userMediaTweets);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
