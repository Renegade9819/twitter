import 'package:flutter/material.dart';
import 'package:twitter/navigation_bar_screens/feed_screen.dart';
import 'package:twitter/navigation_bar_screens/message_screen.dart';
import 'package:twitter/navigation_bar_screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    FeedScreen(),
    NotificationScreen(),
    MessageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          title: buildAppBarTitle(_selectedIndex),
          actions: [
            IconButton(
              onPressed: () {},
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

  Widget buildAppBarTitle(int index) {
    if (index == 0) {
      return buildAppBarTitleImage();
    } else if (index == 1) {
      return buildAppBarTitleText();
    } else {
      return buildAppBarTextField();
    }
  }

  TextField buildAppBarTextField() {
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
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }

  Text buildAppBarTitleText() {
    return const Text(
      'Notifications',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Image buildAppBarTitleImage() {
    return Image.asset(
      "assets/images/twitterlogo.png",
      height: 20,
      width: 20,
    );
  }
}
