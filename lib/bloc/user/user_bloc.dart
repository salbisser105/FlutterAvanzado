import 'package:estados/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is ActivateUser) {
      //Yield emits user state can be used only in async functions
      yield state.copyWith(user: event.user);
    } else if (event is ChangeAge) {
      yield state.copyWith(user: state.user.copyWith(edad: event.age));
    } else if (event is AddProfession) {
      yield state.copyWith(
          user: state.user.copyWith(
              profesiones: [...state.user.profesiones, event.profes]));
    } else if (event is DeleteUser) {
      yield state.initialState();
    }
  }
}
