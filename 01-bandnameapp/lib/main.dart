import 'package:bandnameapp/src/pages/home_page.dart';
import 'package:bandnameapp/src/pages/status_page.dart';
import 'package:bandnameapp/src/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:'home',
        routes: {
          'home': (_) => const HomePage(),
          'status': (_) => const StatusPage(),
    
          
        },
      ),
    );
  }
}

