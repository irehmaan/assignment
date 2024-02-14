import 'package:flutter/material.dart';
import 'package:assignment/common/drawer.dart';
import 'package:assignment/model/user_model.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({Key? key}) : super(key: key);

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  late List<User> userList;
  late List<User> filteredUsers;

  @override
  void initState() {
    super.initState();
    userList = [
      User('Imdadul Rehmaan', 'Software Engineer'),
      User('Jane Smith', 'UX Designer'),
      User('Alice Johnson', 'Product Manager'),
      User('John Doe', 'Software Engineer'),
      User('Jane Smith', 'UX Designer'),
      User('Alice Johnson', 'Product Manager'),
      User('Michael Brown', 'Data Analyst'),
      User('Emily Davis', 'Marketing Specialist'),
      User('Chris Wilson', 'Graphic Designer'),
      User('Samantha Miller', 'Project Manager'),
      User('David Martinez', 'Software Developer'),
      User('Olivia Taylor', 'Business Analyst'),
      User('Daniel Garcia', 'UI Designer'),
    ];
    filteredUsers = userList;
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = userList
          .where((user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.designation.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String? selected = await showSearch<String>(
                context: context,
                delegate: _UserSearchDelegate(userList),
              );
              if (selected != null && selected.isNotEmpty) {
                _filterUsers(selected);
              }
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: ListView.builder(
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          // Build list item for each user

          return ListTile(
            leading: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          "https://i.pinimg.com/474x/49/4d/2e/494d2e25fad7412b4f11beb7242ba804.jpg",
                          height: 40,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(filteredUsers[index].name),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(filteredUsers[index].designation),
                )
              ],
            ),
            minVerticalPadding: 5,
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            tileColor: Colors.white,
            trailing: const Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}

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
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // This method is called when the search result selection is made.
    // We don't need to implement it since we handle the search logic in the main screen.
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
            // Handle tap action if needed
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.grey.shade500,
    );
  }
}
