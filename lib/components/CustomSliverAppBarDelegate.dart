import 'package:flutter/material.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String? avatarURL;
  const CustomSliverAppBarDelegate(
      {required this.expandedHeight, required this.avatarURL});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double size = 40 - shrinkOffset * 0.1;
    double top = expandedHeight - shrinkOffset - size;
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset, context),
        buildAppBar(shrinkOffset, context),
        Positioned(
          top: top,
          left: 15,
          child: buildAvatar(shrinkOffset, avatarURL),
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

  Widget buildAppBar(double shrinkOffset, context) {
    return Opacity(
      opacity: appear(shrinkOffset),
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  double appear(double shrinkOffset) {
    return shrinkOffset / expandedHeight;
  }

  double disappear(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }

  Widget buildBackground(double shrinkOffset, context) {
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
            top: 28,
            left: 4,
            child: shrinkOffset * 0.7 > 40
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(double shrinkOffset, String? avatarURL) {
    ImageProvider imageWidget;
    if (avatarURL == null) {
      imageWidget = const AssetImage("assets/avatars/default_avatar.png");
    } else {
      imageWidget = AssetImage(avatarURL);
    }
    return Opacity(
      opacity: disappear(shrinkOffset),
      child: CircleAvatar(
        minRadius: 40 - shrinkOffset * 0.1,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          minRadius: 39 - shrinkOffset * 0.1,
          backgroundImage: imageWidget,
        ),
      ),
    );
  }
}
