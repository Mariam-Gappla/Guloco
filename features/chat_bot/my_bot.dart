import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyBot extends StatefulWidget {
  const MyBot({super.key});
static String id = 'GlocuBot';
  @override
  State<MyBot> createState() => _MyBotState();
}

class _MyBotState extends State<MyBot> {
  ChatUser mySelf = ChatUser(id: '1', firstName: 'taha');
  ChatUser bot = ChatUser(id: '2', firstName: 'Gluco');

  List<ChatMessage> allMessages = [];

  final OurUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyAwY6frY4mjtrMWzMwTMSRiTgyyZSb7Iow';

  final header = {
    'Content-Type': 'application/json',
  };
  getData(ChatMessage m) async {
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text},
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(OurUrl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
        setState(() {});
      } else {
        print('Error Occured');
      }
    }).catchError((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
        currentUser: mySelf,
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: allMessages,
      ),
    );
  }
}
