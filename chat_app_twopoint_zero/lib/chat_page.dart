import 'package:chatapptwopointzero/components/chats.dart';
import 'package:chatapptwopointzero/users/chat_user.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: 'Johna',
        image: 'assets/images/01-shutterstock_476340928-Irina-Bg-1024x683.jpg',
        secondaryText: 'You have Something ',
        time: 'Now'),
    ChatUsers(
        text: 'Goot',
        image: 'assets/images/clover-bling-brown-03.jpg',
        secondaryText: 'are ypu programmer ',
        time: 'Today'),
    ChatUsers(
        text: 'Selena',
        image: 'assets/images/HOW-TO-GROW-HAIR-FASTER_1_OI.jpg',
        secondaryText: 'You have Somrthing ',
        time: 'Today'),
    ChatUsers(
        text: 'Alex',
        image: 'assets/images/New-Profile-20-500x536.jpg',
        secondaryText: 'you are',
        time: 'Yesterday'),
    ChatUsers(
        text: 'Tikshwar',
        image: 'assets/images/tinku.jpg',
        secondaryText: 'You have Something ',
        time: '8 july'),
    ChatUsers(
        text: 'Alex',
        image: 'assets/images/clover-bling-brown-03.jpg',
        secondaryText: 'You have Something ',
        time: '8 july'),
    ChatUsers(
        text: 'john',
        image: 'assets/images/clover-bling-brown-03.jpg',
        secondaryText: 'You have Something ',
        time: '8 july'),
    ChatUsers(
        text: 'Ram',
        image: 'assets/images/clover-bling-brown-03.jpg',
        secondaryText: 'You have Something ',
        time: '8 july'),
    ChatUsers(
        text: 'Ram',
        image: 'assets/images/01-shutterstock_476340928-Irina-Bg-1024x683.jpg',
        secondaryText: 'You have Something ',
        time: '8 july'),
    ChatUsers(
        text: 'Me',
        image: 'assets/images/01-shutterstock_476340928-Irina-Bg-1024x683.jpg',
        secondaryText: 'You have Something ',
        time: '8 july'),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Chats',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Mon',
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.blue[50],
                      ),
                      height: 30,
                      child: Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8, left: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey.shade100,
                      )),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatUserList(
                  text: chatUsers[index].text,
                  image: chatUsers[index].image,
                  secondaryText: chatUsers[index].secondaryText,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
