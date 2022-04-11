import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//enum para definir los estados del server

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;
  IO.Socket get socket => _socket;
  ServerStatus get serverStatus => _serverStatus;

  Function get emit => _socket.emit;
  
  SocketService() {
    initConfig();
  }
  void initConfig() {
    _socket = IO.io('http://192.168.0.16:3000', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    _socket.onConnect((_) {
      print('connect');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    _socket.on('nuevo-mensaje', (payload) {
      print('nuevo-mensaje:');
      print('nombre: ' + payload['nombre']);
      print('mensaje: ' + payload['mensaje']);

      print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'no hay');
    });
  }
}
