//import 'dart:html';

//import 'dart:js';

//import 'dart:js';

import 'package:chatapptwopointzero/components/appbar.dart';
import 'package:chatapptwopointzero/components/chats-bubble.dart';
import 'package:chatapptwopointzero/components/sendmenue_item.dart';
import 'package:chatapptwopointzero/users/chat_message.dart';
import 'package:flutter/material.dart';


enum MessageType{
    Sender,
  Reciver,

}

class ChatDetailsPage extends StatefulWidget {

  @override
  _ChatDetailsPageState createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
      List<ChatMessage> chatMessage = [
        ChatMessage(message: 'Hi Alex!!',type: MessageType.Reciver),
        ChatMessage(message: 'how Are You??',type: MessageType.Reciver),
        ChatMessage(message: 'Hello! i am fine',type: MessageType.Sender),
        ChatMessage(message: 'Dealing With Errors!',type: MessageType.Reciver),
        ChatMessage(message: 'Yup!!',type: MessageType.Sender),
      ];

      List<SendMenuItems>  menuItems = [

        SendMenuItems(text: 'Image', icons: Icons.image, color: Colors.amber),
        SendMenuItems(text: 'Send File', icons: Icons.insert_drive_file, color: Colors.grey),
        SendMenuItems(text: 'Audio', icons: Icons.music_note, color: Colors.purple),
        SendMenuItems(text: 'Location', icons: Icons.location_on, color: Colors.orange),
        SendMenuItems(text: 'Contact', icons: Icons.person, color: Colors.blue),
      ];

        void showModal(){
          showModalBottomSheet(
          context: context,
            builder: (context){
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                ),

                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 4,
                        width: 50,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    ListView.builder(
                      itemCount: menuItems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: menuItems[index].color.shade100,
                              ),
                              height: 50,
                              width: 50,
                              child: Icon(menuItems[index].icons,size: 20,color:menuItems[index].color.shade400),
                            ),
                            title: Text(menuItems[index].text),
                          ),
                        );
                      },

                    )
                  ],
                ),

              );
            }
          );
        }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: ChatDetailsAppBar(),
          body: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: chatMessage.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){

                  return ChatBubble(
                    chatMessage: chatMessage[index],

                  );
                },

              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(

                  padding: EdgeInsets.only(left: 16,bottom: 10,),
//                  height: 80,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          showModal();
                        },
                        child: Container(
                          height: 40, width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.add,color: Colors.white,size: 21,),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type Message....",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),

                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 30,bottom: 50),
                  child: FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,),
                    backgroundColor: Colors.pink,
                    elevation: 0,
                  ),
                ),
              )
            ],
          ),

        );
      }
}
