import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        actions: [
          IconButton(
            onPressed: () => userService.removeUser(),
            icon: Icon(Icons.exit_to_app
          )
          )],
      ),
      body: userService.userExists
          ? UserInfo(userService.user)
          : Center(
              child: Text(
              'No existe un usuario',
              style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: Icon(Icons.accessibility_new),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            title: Text('Nombre: ${user.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${user.edad} '),
          ),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          // ListTile(
          //   title: Text('Profesión 1: '),
          // ),
          // ListTile(
          //   title: Text('Profesión 2: '),
          // ),
          // ListTile(
          //   title: Text('Profesión 3: '),
          // ),

          ...user.profesiones.map(
            (profesion) => ListTile(title: Text(profesion)))
            .toList()

        ],
      ),
    );
  }
}
