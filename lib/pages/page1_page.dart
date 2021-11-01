import 'package:estados/bloc/user/user_bloc.dart';
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
        actions: [
          IconButton(
            onPressed: () => BlocProvider.of<UserBloc>(context).add(DeleteUser()),
            icon: Icon(Icons.delete))
        ],
      ),
      body: BlocBuilder<UserBloc,UserState>(
        builder: ( _ , state) {
          if (state.userExists){
             return UserInfo(state.user);
          }else {
             return Center(
               child: Text('No hay un usuario seleccionado'),
             );
          }
        },
      ),
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
            title: Text('Edad: ${user.edad}'),
          ),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // Divider(),
          // ListTile(
          //   title: Text('Profesión 1: '),
          // ),
          // ListTile(
          //   title: Text('Profesión 2: '),
          // ),
          // ListTile(
          //   title: Text('Profesión 3: '),
          // ),
          ...user.profesiones.map((profesion) => ListTile(title: Text(profesion))).toList()
        ],
      ),
    );
  }
}
