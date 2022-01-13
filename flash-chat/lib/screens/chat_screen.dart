import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessages() async {
  //   // getDocuments method : querySnapshot datatype <<- snapshot of the data comes from firebase
  //   final messages = await _firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        var messegeData = message.data();
        var messageSender = messegeData['sender'];
        var messageText = messegeData['text'];
        print(
            'this is messege sender $messageSender and this is message text $messageText');
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                messagesStream();
                //Implement logout functionality
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // StreamBuilder<QuerySnapshot>(
            //   stream: _firestore.collection('messages').snapshots(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       final messages = snapshot.data.documents;
            //       List<Text> messageWidgets = [];
            //       for (var message in messages) {
            //         final messageText = message.data['text'];
            //         final messageSender = message.data['sender'];
            //         final messageWidget = Text ('$messageWidgets from $messageSender');
            //         }
            //       return Column(children: messageWidgets,);
            //       }
            //   },
            // ),
            // StreamBuilder<QuerySnapshot>(
            //   stream: _firestore.collection('messages').snapshots(),
            //   builder: (context, snapshot) {
            //     List<Text> messageWidgets = [];
            //     if (!snapshot.hasData) {
            //       return Center(
            //         child: CircularProgressIndicator(
            //           backgroundColor: Colors.lightBlueAccent,
            //         ),
            //       );
            //     }
            //
            //     final messages = snapshot.data.docs;
            //
            //     for (var message in messages) {
            //       final messageData = message.data();
            //       final messageText = messageData['text'];
            //       final messageSender = messageData['sender'];
            //       final messageWidget =
            //           Text('$messageSender from $messageText');
            //       messageWidgets.add(messageWidget);
            //     }
            //
            //     return Column(
            //       children: messageWidgets,
            //     );
            //   },
            // ),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                List<MessageBubble> messageBubbles = [];
                if (snapshot.hasData) {
                  // data!.docs **
                  final messages = snapshot.data!.docs;

                  for (var message in messages) {
                    final messageText = message.get('text');
                    final messageSender = message.get('sender');
                    final messageBubble =
                        MessageBubble(sender: messageSender, text: messageText);
                    // Text(
                    //   '$messageSender said $messageText',
                    //   style: TextStyle(fontSize: 60.0),
                    // );
                    messageBubbles.add(messageBubble);
                  }
                }
                return Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: messageBubbles,
                  ),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement send functionality.
                      // todo 14-3 messageText + loggedInUser.email
                      _firestore.collection('messages').add(
                          {'text': messageText, 'sender': loggedInUser.email});
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text});
  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(30),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
