import 'package:chatapptwopointzero/components/chats_details.dart';
import 'package:chatapptwopointzero/users/chat_message.dart';
import 'package:flutter/material.dart';


class ChatBubble extends StatefulWidget{
  ChatMessage chatMessage;
  ChatBubble({@required this.chatMessage});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Reciver?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.type == MessageType.Reciver?Colors.white:Colors.grey.shade300),
          ),
          padding: EdgeInsets.all(16),
         child: Text(widget.chatMessage.message),

        ),
      ),

    );

  }
}