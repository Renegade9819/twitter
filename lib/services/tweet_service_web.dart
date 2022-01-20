import 'dart:convert';
import 'dart:io';

import 'package:twitter/models/tweet.dart';
import 'package:twitter/services/tweet_service_api.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:twitter/api/api_constants.dart' as api;

class TweetServiceWeb implements TweetServiceAPI {
  String apiUrl = api.baseUrl;

  @override
  Future<List<Tweet>> getAllTweets() async {
    List<Tweet> allTweets = [];

    final response = await http.get(Uri.parse(apiUrl + "/tweet/all/latest"));

    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      allTweets =
          List<Tweet>.from(results.map((model) => Tweet.fromJson(model)));

      return allTweets;
    } else {
      return allTweets;
    }
  }

  @override
  Future<List<Tweet>> getUserLikedTweets(String userName) async {
    List<Tweet> likedTweets = [];

    final response =
        await http.get(Uri.parse(apiUrl + "/tweet/get/liked/$userName"));

    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      likedTweets =
          List<Tweet>.from(results.map((model) => Tweet.fromJson(model)));

      return likedTweets;
    } else {
      return likedTweets;
    }
  }

  @override
  Future<List<Tweet>> getUserMediaTweets(String userName) async {
    List<Tweet> mediaTweets = [];

    final response =
        await http.get(Uri.parse(apiUrl + "/tweet/get/media/$userName"));

    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      mediaTweets =
          List<Tweet>.from(results.map((model) => Tweet.fromJson(model)));

      return mediaTweets;
    } else {
      return mediaTweets;
    }
  }

  @override
  Future<List<Tweet>> getUserTweets(String userName) async {
    List<Tweet> userTweets = [];

    final response = await http.get(Uri.parse(apiUrl + "/tweet/all/$userName"));

    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      userTweets =
          List<Tweet>.from(results.map((model) => Tweet.fromJson(model)));

      return userTweets;
    } else {
      return userTweets;
    }
  }

  @override
  Future<int> postMediaTweet(File mediaFile, String userName) async {
    var mediaTweetUploadURI =
        Uri.parse(apiUrl + "/user/tweet/set/media/$userName");
    var mediaTweetRequest = http.MultipartRequest("POST", mediaTweetUploadURI);

    var multipartFile = await http.MultipartFile.fromPath(
        'image', mediaFile.path,
        contentType: MediaType.parse("multipart/form-data"));

    mediaTweetRequest.files.add(multipartFile);

    http.Response response =
        await http.Response.fromStream(await mediaTweetRequest.send());
    int mediaId = 0;

    if (response.statusCode == 200) {
      mediaId = int.parse(response.body);
      return mediaId;
    } else {
      throw Exception("Could not post media tweet");
    }
  }

  @override
  Future<Tweet> postTweet(Tweet tweet) async {
    final response = await http.post(
      Uri.parse(apiUrl + "/tweet/post"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(tweet),
    );

    if (response.statusCode == 200) {
      Tweet tweet = Tweet.fromJson(jsonDecode(response.body));
      return tweet;
    } else {
      throw Exception("Could not post tweet");
    }
  }

  @override
  Future<bool> likeTweet(int tweetId, String userName) async {
    final response = await http.put(
      Uri.parse(apiUrl + "/tweet/like/$tweetId/$userName"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> unlikeTweet(int tweetId, String userName) async {
    final response = await http.put(
      Uri.parse(apiUrl + "/tweet/unlike/$tweetId/$userName"),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
