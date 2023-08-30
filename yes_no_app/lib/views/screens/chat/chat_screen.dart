import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entidies/message.dart';
import 'package:yes_no_app/views/providers/chat_provider.dart';
import 'package:yes_no_app/views/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/views/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/views/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // "leading" es un espacio antes del titulo
        leading: const Padding(
          padding: EdgeInsets.all(3.1),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/1200x/aa/ba/8b/aaba8b3443011184e4b77f0f19261082.jpg")),
        ),
        title: const Text("Mi Reina 👑"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    // "SafeArea" es un widget para meter todos los widget en area segura
    return SafeArea(
      // "Padding" es para darle espacio entre los widgets
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Column(
          children: [
            // "Expanded" es para darle a un widget el espacio disponible que el padre le de
            Expanded(
                // "Container" es como un "Div" en HTML
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.she)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
            // Caja de texto o chat de teclado
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
