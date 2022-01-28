import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/my_spinner.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Users>(context).getAllUsers().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });
        print('HOME SCREEN ERROR $error');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Une erreur s'est produite !"),
        ));
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context).items;
    print('users $users');
    return Scaffold(
      appBar: AppBar(
        title: Text('Nos utilisateurs'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? MySpinner()
          : (users.length > 0)
              ? Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                "${users[i].firstName[0].toUpperCase()} ${users[i].lastName[0].toUpperCase()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor:
                                  i % 2 == 0 ? Colors.orange : Colors.grey,
                            ),
                            title: Text(
                              "${users[i].firstName} ${users[i].lastName}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              users[i].email,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Divider()
                        ],
                      );
                    },
                  ),
                )
              : Center(
                  child: Text('Aucune demande de messe pour le moment'),
                ),
    );
  }
}
