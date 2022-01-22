import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter/constants/api_constants.dart' as api;

class ImageFullScreen extends StatefulWidget {
  final int mediaId;
  const ImageFullScreen({Key? key, required this.mediaId}) : super(key: key);

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
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 2,
              child: Image(
                image: NetworkImage(api.mediaUrl + "${widget.mediaId}"),
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
