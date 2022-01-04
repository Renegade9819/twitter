import 'package:flutter/material.dart';

class TweetScreenV2 extends StatefulWidget {
  const TweetScreenV2({Key? key}) : super(key: key);

  @override
  _TweetScreenV2State createState() => _TweetScreenV2State();
}

class _TweetScreenV2State extends State<TweetScreenV2> {
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
            onPressed: () {},
            icon: Icon(Icons.close),
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
        body: TextField(),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                constraints: BoxConstraints(),
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
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
