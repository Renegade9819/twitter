import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/components/CustomCircularProgressIndicator.dart';

class TweetScreen extends StatefulWidget {
  const TweetScreen({Key? key}) : super(key: key);

  @override
  _TweetScreenState createState() => _TweetScreenState();
}

class _TweetScreenState extends State<TweetScreen> {
  TextEditingController tweetController = TextEditingController();
  int tweetLength = 280;

  @override
  void initState() {
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
                onPressed: () {},
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
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png"),
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
                  onPressed: () {},
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
}
