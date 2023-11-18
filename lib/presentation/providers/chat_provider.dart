import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Iniciando Conversación', fromWho: FromWho.me),
    //Message(text: 'Ya Regresaste', fromWho: FromWho.me),
  ];

  String urlServidor = "";

  Future<void> sendMessage(String text, String purlServer) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    //if (text.endsWith('?')) {
    herReply(text, purlServer);
    //}
    //Refresca hubo un cambio en el providers
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String pPregunta, String pUrlServerIA) async {
    final herMessage = await getYesNoAnswer.getAnswer(pPregunta, pUrlServerIA);
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
