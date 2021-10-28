import 'package:estados/models/user.dart';
import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: userService.userExists
            ? Text('Nombre: ${userService.user.nombre}')
            : Text('Page2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              final newUser = new User(
                  nombre: 'Santiago Albisser',
                  edad: 22,
                  profesiones: [
                    'Ing de Sistemas',
                    'Ing administrativo',
                    'Ing Fisico'
                  ]);

              userService.user = newUser;
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
            onPressed: () {
              userService.addProfesion();
            },
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
