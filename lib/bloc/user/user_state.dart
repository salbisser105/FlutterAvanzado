part of 'user_bloc.dart';

class UserState {
  final bool userExists;
  final User user;

  UserState({User userarg})
      : user = userarg ?? null,
        userExists = (userarg != null) ? true : false;

  UserState copyWith({
    User user,
  }) =>
      UserState(userarg: user ?? this.user);


  UserState initialState () => new UserState();
  
}
