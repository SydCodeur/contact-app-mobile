import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../environnment.dart';

import 'dart:convert';

import '../models/User.dart';

class Users with ChangeNotifier {
  List<User> _items = [];

  List<User> get items {
    return [..._items];
  }

  Future<void> getAllUsers() async {
    final url = Uri.parse('${MyEnvironnment.apiUrl}/auth/users');

    try {
      final response = await http.get(
        url,
      );

      final fetchedData = json.decode(response.body)['users'];
      // print('User LIST $fetchedData');

      List<User> loadedUsers = [];
      fetchedData.forEach((userData) {
        loadedUsers.add(
          User(
            firstName: userData['firstName'],
            lastName: userData['lastName'],
            email: userData['email'],
          ),
        );
      });

      _items = loadedUsers;
      notifyListeners();
    } catch (error) {
      print('ERROR $error');
      throw error;
    }
  }
}
