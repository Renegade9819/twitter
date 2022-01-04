import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatefulWidget {
  final TextEditingController controller;
  const CustomCircularProgressIndicator({Key? key, required this.controller})
      : super(key: key);

  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator> {
  double? progressValue;

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
