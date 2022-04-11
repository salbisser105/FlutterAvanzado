import 'package:bandnameapp/src/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('ServerStatus: ${socketService.serverStatus}'),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          print('test');
          socketService.emit('emitir-mensaje',
              {'nombre': 'Flutter', 'mensaje': 'hola desde flutter'});
        },
      ),
    );
  }
}
