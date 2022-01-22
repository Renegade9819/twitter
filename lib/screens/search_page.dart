import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service_api.dart';
import 'package:twitter/constants/api_constants.dart' as api;

class SearchUsers extends SearchDelegate<String> {
  UserServiceAPI userServiceWeb = serviceLocator<UserServiceAPI>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_rounded,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: userServiceWeb.getUserBySearchTerm(query),
      builder: (context, snapshot) {
        if (query.isEmpty) return buildNoSuggestions();
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError || snapshot.data!.isEmpty) {
              return buildNoSuggestions();
            } else {
              return buildSuggestionsSuccess(snapshot.data!);
            }
        }
      },
    );
  }

  Widget buildNoSuggestions() {
    return Container();
  }

  Widget buildSuggestionsSuccess(List<User> suggestions) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          int? avatarId = suggestion.avatarId;

          ImageProvider imageWidget;
          if (avatarId == null) {
            imageWidget = const AssetImage("assets/avatars/default_avatar.png");
          } else {
            imageWidget = NetworkImage(api.avatarUrl + "$avatarId");
          }

          return ListTile(
            tileColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: imageWidget,
              ),
            ),
            title: Text(
              suggestion.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '@' + suggestion.userName,
              style: const TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile', arguments: suggestion);
            },
          );
        });
  }
}
