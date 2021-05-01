import 'package:chatapp/services/database.dart';
import 'package:chatapp/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchTextEditingController = new  TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot searchSnapshot;

  initiateSearch(){
    databaseMethods
        .getUserByUserName(searchTextEditingController.text).then((val){
          setState(() {
            searchSnapshot = val;
          });
      });

  }

createChatRoomAndStartConversation(String userNmae){
      List<String> users = [ userNmae ,];
        databaseMethods.createChatRoom(chatRoomId, chatRoomMap);

    }

  Widget searchList(){
    return searchSnapshot != null ? ListView.builder(
      itemCount: searchSnapshot.documents.length,
      shrinkWrap:  true,
      itemBuilder: (context , index){
        return SearchTile(
          userName: searchSnapshot.documents[index].data["name"],
          userEmail: searchSnapshot.documents[index].data["email"],
        );
      }) : Container();

  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(

//        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16
              ,
              vertical: 4),
              color: Colors.teal,
              child: Row(
                children: <Widget>[
                  Expanded(child: TextField(
                    controller: searchTextEditingController,
                    style: TextStyle(
                color: Colors.white,
              ),

                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'search username',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                    ),
                  )),
                 GestureDetector(
                   onTap: (){
                     initiateSearch();
                   },
                   child: Container(
                     height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                         colors: [
                           const Color(0x36ffffff),
                           const Color(0x0ffffff),
                         ]

                       ),
                       borderRadius: BorderRadius.circular(30)
                     ),

                     padding: EdgeInsets.all(6),
                     child: Image.asset('assets/images/3.png'),

                   ),
                 ),
                  searchList()

                ],
              ),
            ),
            searchList()
          ],
        ),
      ),

      
    );
  }
}

class SearchTile extends StatelessWidget {

  final String userName;
  final String userEmail;
  SearchTile({this.userName , this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,
      vertical: 16),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(userName, style: simpleTextStyle(),),
              Text(userEmail, style: simpleTextStyle(),),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              child: Text('Messgae',
              style: searcheTextStyle(),),
              padding: EdgeInsets.symmetric(
                vertical: 8, horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(13),


              ),

            ),
          )
        ],
      ),
    );
  }
}
