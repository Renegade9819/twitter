import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/services/service_locator.dart';
import 'package:twitter/services/user_service.dart';
import 'package:twitter/services/user_service_api.dart';

class SearchUsers extends SearchDelegate<String> {
  UserService userService = serviceLocator<UserService>();
  UserServiceAPI userServiceWeb = serviceLocator<UserServiceAPI>();

  List<User> userList = [];
  List<User> recentUsers = [];

  SearchUsers() {
    userList = userService.getAllUsers().toList();
  }

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
            return buildSuggestionsSuccess(snapshot.data!);
        }
      },
    );
    // final suggestions = query.isEmpty
    //     ? recentUsers
    //     : userList.where((user) {
    //         final nameLower = user.name.toLowerCase();
    //         final queryLower = query.toLowerCase();

    //         final userNameLower = user.userName.toLowerCase();

    //         if (nameLower.contains(queryLower)) {
    //           return true;
    //         } else if (userNameLower.contains(queryLower)) {
    //           return true;
    //         } else {
    //           return false;
    //         }
    //       }).toList();

    // return buildSuggestionsSuccess(suggestions);
  }

  Widget buildNoSuggestions() {
    return Container();
  }

  Widget buildSuggestionsSuccess(List<User> suggestions) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            tileColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                backgroundImage: suggestion.avatarURL == null
                    ? const AssetImage("assets/avatars/default_avatar.png")
                    : AssetImage(suggestion.avatarURL!),
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
