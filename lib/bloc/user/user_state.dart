part of 'user_cubit.dart';

// we need to handle the states that doesnt change (immutables) and also need to notify which type of state it is
@immutable
abstract class UserState {} //this is to control our state.

class InitialUser extends UserState {
  final userExist = false;
}

//New state
//We have 1 user saved her
class SelectedUser extends UserState{
  final userExist = true;
  final User user;

  SelectedUser(this.user);
  
}