import 'package:flutter/material.dart';

class TweetCharCountIndicator extends StatefulWidget {
  final TextEditingController controller;
  const TweetCharCountIndicator({Key? key, required this.controller})
      : super(key: key);

  @override
  _TweetCharCountIndicatorState createState() =>
      _TweetCharCountIndicatorState();
}

class _TweetCharCountIndicatorState extends State<TweetCharCountIndicator> {
  double progressValue = 0;

  @override
  void initState() {
    widget.controller.addListener(onTextLengthChange);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTextLengthChange() {
    setState(() {
      progressValue = widget.controller.text.length / 280;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      backgroundColor: Colors.grey,
      value: progressValue,
      valueColor: const AlwaysStoppedAnimation(Colors.blue),
    );
  }
}
