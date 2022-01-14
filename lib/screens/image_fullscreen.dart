import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageFullScreen extends StatefulWidget {
  final String mediaURL;
  const ImageFullScreen({Key? key, required this.mediaURL}) : super(key: key);

  @override
  _ImageFullScreenState createState() => _ImageFullScreenState();
}

class _ImageFullScreenState extends State<ImageFullScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: 'imageHeroBig',
            child: InteractiveViewer(
              panEnabled: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 2,
              child: Image(
                image: AssetImage(widget.mediaURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
