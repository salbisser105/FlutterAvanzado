import 'package:estados/models/user.dart';
import 'package:estados/pages/page1_page.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data.nombre}')
                : Text('Page2');
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              final newUser = new User(nombre: 'Santiago', edad: 22);
              userService.loadUser(newUser);
            },
            child: Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              userService.changeAge(23);
            },
            child: Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              'Agregar profesión ',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
