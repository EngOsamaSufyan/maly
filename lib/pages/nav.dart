import 'package:flutter/material.dart';

import '../maly_db/db.dart';


class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final users = await MyDatabase.getUsers();
    setState(() {
      _users = users;
    });
  }

// ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body:
          ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return ListTile(
                title: Text(user['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Number: ${user['number']}'),
                    Text('Personal Card: ${user['personalCard']}'),
                    Text('Password: ${user['password']}'),
                    Text('Photo 1: ${user['photo1']}'),
                    Text('Photo 2: ${user['photo2']}'),
                    Text('Photo 3: ${user['photo3']}'),
                  // Define a TextEditingController for the user ID input


                  ],
                ),
              );
            },
          ),


    );
  }
}