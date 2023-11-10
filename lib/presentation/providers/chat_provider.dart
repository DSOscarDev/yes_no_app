import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Holas', fromWho: FromWho.me),
    Message(text: 'ya Regresaste', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    // TODO: implementar método
  }
}
