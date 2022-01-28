import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twitter/constants/api_constants.dart' as api;
import 'package:twitter/core/models/user.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/ui/screens/navigation_bar_screens/feed_screen.dart';
import 'package:twitter/ui/screens/navigation_bar_screens/message_screen.dart';
import 'package:twitter/ui/screens/navigation_bar_screens/notification_screen.dart';
import 'package:twitter/ui/screens/search_page.dart';
import 'package:twitter/ui/widgets/expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User loggedInUser;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      FeedScreen(),
      NotificationScreen(),
      MessageScreen(),
    ];
    loggedInUser = context.watch<UserProvider>().loggedInUser;
    int? avatarId = loggedInUser.avatarId;
    ImageProvider avatarImageWidget;
    if (avatarId == null) {
      avatarImageWidget = const AssetImage("assets/avatars/default_avatar.png");
    } else {
      avatarImageWidget = NetworkImage(api.avatarUrl + "$avatarId");
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profile',
                    arguments: loggedInUser),
                child: Hero(
                  tag: 'profilePic',
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    backgroundImage: avatarImageWidget,
                    //   backgroundImage: NetworkImage(
                    //       "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          title: AppBarTitle(index: _selectedIndex),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/welcome', (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.redAccent,
              ),
            ),
          ],
          bottom: PreferredSize(
            child: Container(
              color: Colors.black,
              height: 0.3,
            ),
            preferredSize: const Size.fromHeight(0.3),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        floatingActionButton: FAB(index: _selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_rounded),
              label: 'Messages',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class AppBarTitle extends StatelessWidget {
  final int index;
  const AppBarTitle({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Image.asset(
        "assets/images/twitterlogo.png",
        height: 20,
        width: 20,
      );
    } else if (index == 1) {
      return const Text(
        'Notifications',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return TextField(
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "Search for people",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey[200],
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
        ),
      );
    }
  }
}

class FAB extends StatelessWidget {
  final int index;
  const FAB({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == 2) {
      return FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, '/chatScreen');
        },
        child: const Icon(
          Icons.chat_rounded,
          color: Colors.white,
        ),
      );
    } else {
      return ExpandableFAB(
        distance: 66.0,
        children: [
          ActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tweetScreen');
            },
            icon: const Icon(
              Icons.create,
              color: Colors.white,
            ),
          ),
          ActionButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUsers());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      );
    }
  }
}
