import 'package:estados/bloc/user/user_cubit.dart';
import 'package:estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        actions:[
          IconButton(
            onPressed: () => context.read<UserCubit>().deleteUser(),
            icon:Icon(Icons.delete) ),
        ]
      ),
      
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: Icon(Icons.accessibility_new),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      switch (state.runtimeType) {
        case InitialUser:
          return Center(child: Text('No hay información del usuario'));

        case SelectedUser:
          return UserInfo((state as SelectedUser).user);

        default:
          return Center(child: Text('Estado no reconocido '));
      }
// if (state is InitialUser) {
      //     //   return Center(child: Text('No hay información del usuario'));
      //     // } else if (state is SelectedUser) {
      //     //   return UserInfo(state.user);
      //     // }else{
      //     //   return Center(child: Text('Estado no reconocido'));
      //     // }
    });
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
            title: Text('Nombre: ${user.nombre} '),
          ),
          ListTile(
            title: Text('Edad: ${user.edad}'),
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

          //... means spread operator
          ...user.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
