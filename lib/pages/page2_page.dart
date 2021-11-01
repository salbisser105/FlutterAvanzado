import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final userBloc =BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(

            onPressed: () {
              final newUser = new User(
                nombre: 'Santiago Albisser',
                edad: 34,
                profesiones: ['FullStack Developer', 'Game design']
              );
              userBloc.add(ActivateUser(newUser));
            },
            child: Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              userBloc.add(ChangeAge(23));
            },
            child: Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              userBloc.add(AddProfession('profesion1'));
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
