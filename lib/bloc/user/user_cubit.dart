//This one is in charge to receive petitions, send petittions and change the state of the app 

import 'package:estados/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

//We need to specify what type of info runs inside 
class UserCubit extends Cubit<UserState>{

  UserCubit() : super(InitialUser());
  
  void selectUser(User user){
    emit(SelectedUser(user));
  }

  void changeAge(int age){
    final currentState = state;
    if(currentState is SelectedUser){
      final newUser = currentState.user.copyWith(edad: age);
      emit(SelectedUser(newUser));
    }
  }
 void addExperience() {
    
    final currentState = state;
    if ( currentState is SelectedUser ) {
      // currentState.usuario
      final newProfesiones = [
        ...currentState.user.profesiones,
        'Profesión ${ currentState.user.profesiones.length + 1 }'
      ];
      final newUser = currentState.user.copyWith( profesiones: newProfesiones );
      emit( SelectedUser(newUser) );
    }
  }


  void deleteUser() {
    emit(InitialUser());
  }


}