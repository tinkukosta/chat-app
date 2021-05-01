import 'package:chatapptwopointzero/chat_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey.shade100,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,

        ),
        type: BottomNavigationBarType.fixed,
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Group'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text('Call'),
          ),
        ],
      ),
      body: ChatPage(),
    );
  }
}
