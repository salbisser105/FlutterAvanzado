import 'dart:async';

import 'package:estados/models/user.dart';

//This is our singleton.
class _UserService {
  User _user;

  //We need to use an stream to check if there are any changes in the information provided by the user. so it can reload and paint out the new info.
  //By default an stream is created by a single suscription or single listener 
  //That means there can be only 1 person listenning to that stream. at the moment.( 1 to 1 kind of communication)
  StreamController<User> _userStreamController = new StreamController<User>.broadcast();



  User get user => this._user;

//Checks for Users already in the App.
  bool get userExists => (this._user != null) ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

//Works for loading the user
  void loadUser(User usuario) {
    this._user = usuario;
    this._userStreamController.add(usuario);
  }

  //Change age
  void changeAge(int edad) {
    this._user.edad = edad;
    this._userStreamController.add(this._user);
  }

//Make sure to always close your streams, that way you wont have risks with memory leaks. 
  dispose(){
    this._userStreamController?.close();
  }

}


final userService = new _UserService();
