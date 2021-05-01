import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUserByUserName(String username) async{
    return await Firestore.instance.collection("users").where("name",isEqualTo: username).getDocuments();

  }
  uploadUserInfo(userMap){
    Firestore.instance.collection("users")
        .add(userMap).catchError((e) {
          print(e);

    });
  }
  createChatRoom(String chatRoomId , chatRoomMap){

    Firestore.instance.collection("chatroom")
        .document(chatRoomId).setData(chatRoomMap).catchError((e){
          print(e.toString());
    });
  }
}