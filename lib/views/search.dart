import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:flutter_firebase/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = new TextEditingController();
  DatabaseMethod databaseMethod = new DatabaseMethod();
  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethod.getUser(search.text).then((res) {
      setState(() {
        searchSnapshot = res;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchResult(
                  userName: searchSnapshot.documents[0].data["name"],
                  userEmail: searchSnapshot.documents[0].data["email"]);
            })
        : Container();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0xff007EF4),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: search,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Search name',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white70)),
                  )),
                  GestureDetector(
                    onTap: () {
                      Container(child: Text('kathir'));
                    },
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                    ),
                  ),
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

class SearchResult extends StatelessWidget {
  final String userName;
  final String userEmail;

  SearchResult({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                userName,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(13)),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text('Message'),
          ),
        ],
      ),
    );
  }
}
