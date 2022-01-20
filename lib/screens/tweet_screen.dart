import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:twitter/components/CustomCircularProgressIndicator.dart';
import 'package:twitter/models/tweet.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/tweet_provider_new.dart';
import 'package:twitter/providers/user_provider.dart';
import 'package:twitter/api/api_constants.dart' as api;
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/tweet_service_api.dart';

class TweetScreen extends StatefulWidget {
  const TweetScreen({Key? key}) : super(key: key);

  @override
  _TweetScreenState createState() => _TweetScreenState();
}

class _TweetScreenState extends State<TweetScreen> {
  TextEditingController tweetController = TextEditingController();
  final TweetServiceAPI tweetServiceWeb = serviceLocator<TweetServiceAPI>();
  int tweetLength = 280;

  late User loggedInUser;

  bool isMediaPicked = false;
  late PlatformFile mediaFile;

  @override
  void initState() {
    loggedInUser =
        Provider.of<UserProvider>(context, listen: false).loggedInUser;
    super.initState();
  }

  @override
  void dispose() {
    tweetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            color: Colors.black,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () async {
                  String tweetBody = tweetController.text.trim();
                  if (tweetBody.isEmpty) {
                    const snackBar = SnackBar(
                      content: Text("Tweet does not contain any text."),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    if (isMediaPicked == false) {
                      Tweet postTweet = Tweet(
                        tweetBody: tweetBody,
                        postDate: DateTime.now(),
                        userName: loggedInUser.userName,
                      );
                      Tweet postedTweet =
                          await tweetServiceWeb.postTweet(postTweet);
                      TweetProvider tweetProvider =
                          Provider.of<TweetProvider>(context, listen: false);
                      tweetProvider.addToAllTweets(postedTweet);
                      tweetProvider.addToUserTweets(postedTweet);
                      Navigator.pop(context);
                    } else {
                      int mediaId = await tweetServiceWeb.postMediaTweet(
                          File(mediaFile.path!), loggedInUser.userName);

                      Tweet postTweet = Tweet(
                        tweetBody: tweetBody,
                        postDate: DateTime.now(),
                        userName: loggedInUser.userName,
                        containsMedia: true,
                        mediaId: mediaId,
                      );

                      Tweet postedTweet =
                          await tweetServiceWeb.postTweet(postTweet);

                      TweetProvider tweetProvider =
                          Provider.of<TweetProvider>(context, listen: false);
                      tweetProvider.addToAllTweets(postedTweet);
                      tweetProvider.addToUserMediaTweets(postedTweet);
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text(
                  'Tweet',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                backgroundImage: buildAvatar(loggedInUser.avatarId),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: tweetController,
                  maxLines: null,
                  minLines: null,
                  maxLength: tweetLength,
                  //textInputAction: TextInputAction.newline,
                  expands: true,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  cursorHeight: 30,
                  decoration: const InputDecoration(
                    hintText: "What's happening?",
                    contentPadding: EdgeInsets.all(6),
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  splashRadius: 24,
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.image,
                    );

                    if (result != null) {
                      setState(() {
                        mediaFile = result.files.single;
                        isMediaPicked = true;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.add_photo_alternate_rounded,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CustomCircularProgressIndicator(
                    controller: tweetController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider buildAvatar(int? avatarId) {
    ImageProvider imageWidget;
    if (avatarId == null) {
      imageWidget = const AssetImage("assets/avatars/default_avatar.png");
      return imageWidget;
    } else {
      imageWidget = NetworkImage(api.avatarUrl + "$avatarId");
      return imageWidget;
    }
  }
}
