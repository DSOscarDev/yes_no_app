import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/Widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTka_CLU7HIu3LiBChv8vmS9JDpHtBojyQbTVLMB4GO6cWcWCc18hgvbUbTmhkLALrT-bw&usqp=CAU'),
          ),
        ),
        //title: const Text('Mi Amor 💙'),
        title: const Text('Chat Tributario'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_done),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return MyModalContent();
                  });
            },
          )
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(
                              message: message,
                            );
                    })),

            /// Caja de texto de Mensaje
            MessageFieldBox(
              //obtener url Servidor
              onValue: (value) =>
                  chatProvider.sendMessage(value, chatProvider.urlServidor),
              //onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class MyModalContent extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  MyModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    _textController.text = chatProvider.urlServidor;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Url Servidor:',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar al presionar el botón
                String TextIngresado = _textController.text;
                chatProvider.urlServidor = TextIngresado;
                Navigator.of(context).pop(); // Cierra el modal
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
