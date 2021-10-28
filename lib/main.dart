import 'package:estados/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/pages/page1_page.dart';
import 'package:estados/pages/page2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //it is the way that the class it is instantiated 
      providers: [
        //lazy creates this instance as soon as the widget is created 
        ChangeNotifierProvider(lazy: false, create: (_) => new UserService(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'page1',
        //Always remember only keep this in routes like here if you are using less than 4 routes.
        //Otherwise implement a routes file, so we keep the main way more clean.
        routes: {'page1': (_) => Page1Page(), 'page2': (_) => Page2Page()},
      ),
    );
  }
}
