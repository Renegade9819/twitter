import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 1000,
              color: Colors.blueGrey,
            ),
          ]))
        ],
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double size = 40 - shrinkOffset * 0.1;
    double top = expandedHeight - shrinkOffset - size;
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 25,
          child: buildAvatar(shrinkOffset),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  Widget buildAppBar(double shrinkOffset) {
    return Opacity(
      opacity: appear(shrinkOffset),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: const Text('Profile'),
      ),
    );
  }

  double appear(double shrinkOffset) {
    return shrinkOffset / expandedHeight;
  }

  double disappear(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }

  Widget buildBackground(double shrinkOffset) {
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1640100921996-8798b85703c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80",
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 10,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(double shrinkOffset) {
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: CircleAvatar(
        minRadius: 40 - shrinkOffset * 0.1,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          minRadius: 39.8 - shrinkOffset * 0.1,
          backgroundImage: const NetworkImage(
              "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
        ),
      ),
    );
  }
}
