import 'package:estados/pages/page1_page.dart';
import 'package:estados/pages/page2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user/user_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => new UserBloc() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
       initialRoute: 'page1',
       //Always remember only keep this in routes like here if you are using less than 4 routes.
       //Otherwise implement a routes file, so we keep the main way more clean.
       routes: {
         'page1': (_) => Page1Page(),
         'page2': (_) => Page2Page()
       },
      ),
    );
  }
}