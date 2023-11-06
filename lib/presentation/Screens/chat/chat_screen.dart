import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/Widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/Widgets/shared/message_field_box.dart';

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
        title: const Text('Cargando...'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const HerMessageBubble()
                          : const MyMessageBubble();
                    })),

            /// Caja de texto de Mensaje
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
