import 'package:flutter/material.dart';
import 'package:hello_there/models/message.dart';
import 'package:hello_there/models/user.dart';


class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override 
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message mensagem, bool souEu) {
    final Container msg = Container(
      margin: souEu
      ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
      : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
  width: MediaQuery.of(context).size.width * 0.75,
  decoration: BoxDecoration(
    color: souEu ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
    borderRadius: souEu
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      mensagem.time,
      style: TextStyle(
        color: Colors.green,
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    SizedBox(height: 8.0),
    Text(
      mensagem.text,
      style: TextStyle(
        color: Colors.green,
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (souEu) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: mensagem.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          iconSize: 31.0,
          color: mensagem.isLiked ? Theme.of(context).primaryColor : Colors.green,
          onPressed: () {},
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:7.0),
      height: 70.0,
      color: Colors.purpleAccent,
      child: Row(
      children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Envie uma mensagem!',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.purpleAccent,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message mensagem = messages[index];
                      final bool souEu = mensagem.sender.id == currentUser.id;
                      return _buildMessage(mensagem, souEu);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
