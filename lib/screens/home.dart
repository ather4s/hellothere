import 'package:flutter/material.dart';
import 'package:hello_there/widgets/category_selector.dart';
import 'package:hello_there/widgets/favorite_contacts.dart';
// ignore: unused_import
import 'package:hello_there/widgets/recent_chats.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 40.0,
          color: Colors.purpleAccent,
          onPressed: () {},
          ),
          title: Text(
            "Alguma coisa aqui",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 32.0, 
              color: Colors.purpleAccent,
              onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              CategorySelector(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(31.0),
                      topRight: Radius.circular(31.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      FavoriteContacts(),
                      RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
