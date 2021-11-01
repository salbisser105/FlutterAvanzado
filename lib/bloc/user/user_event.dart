part of 'user_bloc.dart';


//We need to have our 3 states always connected. 

//The idea of the abstract is to let know our class
//Which type of event our bloc can accept. That way we can control what events we are gonna handle in our Bloc
@immutable
abstract class UserEvent {

}
//Events can be triggered from everywhere in our application. 

class ActivateUser extends UserEvent{
  
  final User user;

  ActivateUser(this.user);



}
class ChangeAge extends UserEvent{
  final int age;
  ChangeAge(this.age); 
}
class AddProfession extends UserEvent{
  final String profes;
  AddProfession(this.profes);
}
class DeleteUser extends UserEvent{
  
}