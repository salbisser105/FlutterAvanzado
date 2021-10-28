import 'package:estados/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserService with ChangeNotifier {
  User _user;
  //With the get we can control the way how we access the user.
  User get user => this._user;
  bool get userExists => this._user != null ? true : false;

  set user  (User usuario){
    this._user = usuario;
    //Notify all places where this user is being used. 
    notifyListeners();
  }

  void changeAge (int edad ){
    this._user.edad = edad;
    notifyListeners();
  }

  void removeUser(){
    this._user = null;
    notifyListeners();
  }
  void addProfesion(){
    this._user.profesiones.add('Profesion ${ this._user.profesiones.length + 1}');
    notifyListeners();
  }

}
