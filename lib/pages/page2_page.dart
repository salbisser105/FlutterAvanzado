import 'package:estados/bloc/user/user_cubit.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Page2Page extends StatelessWidget {
  const Page2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

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
                edad: 22,
                profesiones:[
                  'FullStack Developer',
                  'Videojugador Profesional'
                ]
              );
              userCubit.selectUser(newUser);

            },
            child: Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              userCubit.changeAge(23);
            },
            child: Text(
              'Cambiar edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              userCubit.addExperience();
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
