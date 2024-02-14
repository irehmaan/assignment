import 'package:assignment/model/user_model.dart';
import 'package:flutter/material.dart';

class _UserSearchDelegate extends SearchDelegate<String> {
  final List<User> userList;

  _UserSearchDelegate(this.userList);

  List<User> _filterUsers(String query) {
    return userList
        .where((user) =>
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.designation.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
 
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<User> filteredUsers =
        query.isEmpty ? userList : _filterUsers(query);

    return ListView.builder(
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredUsers[index].name),
          subtitle: Text(filteredUsers[index].designation),
          onTap: () {
     
          },
        );
      },
    );
  }
}
