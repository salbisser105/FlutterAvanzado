import 'package:meta/meta.dart';
class User {
  String nombre;
  int edad;
  List<String> profesiones;

  User({@required this.nombre, this.edad, this.profesiones})
  :assert(nombre !=null);
  //Assert gives us an error if there is something missing.
}
