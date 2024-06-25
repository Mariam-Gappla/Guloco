import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gluco/features/chat/data/msg_model.dart';
import 'package:gluco/features/chat/data/user_model.dart';
import 'package:gluco/features/chat/presentation/manager/fire_database.dart';
import 'package:gluco/features/chat/presentation/view/widgets/chat_msg_card.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.roomId, required this.chatUser});
  final String roomId;
  final ChatUser chatUser;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController msgCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton:  FloatingActionButton(
      //   onPressed: () {
      //     FireData().sendNotification( widget.chatUser, "msg");
      //   },
      //   child: const Icon(Iconsax.send_1),
      // ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatUser.name.toString()),
            Text(
              "Last Seen ${widget.chatUser.lastActivated}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.trash),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.copy),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .doc(widget.roomId)
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MessageModel> messageItems = snapshot.data!.docs
                          .map((e) => MessageModel.fromJson(e.data()))
                          .toList()
                        ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
                      return messageItems.isNotEmpty
                          ? ListView.builder(
                              reverse: true,
                              itemCount: messageItems.length,
                              itemBuilder: (context, index) {
                                return ChatMessageCard(
                                  messageModel: messageItems[index],
                                  index: index,
                                );
                              },
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  FireData().sendMessage(
                                      widget.chatUser.id.toString(),
                                      " 👋 السلام عليكم",
                                      widget.roomId);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "👋",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "السلام عليكم",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: TextField(
                      controller: msgCont,
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Iconsax.emoji_happy),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Iconsax.camera),
                              ),
                            ],
                          ),
                          border: InputBorder.none,
                          hintText: "Message",
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10)),
                    ),
                  ),
                ),
                IconButton.filled(
                    onPressed: () {
                      if (msgCont.text.isNotEmpty) {
                        FireData()
                            .sendMessage(widget.chatUser.id.toString(),
                                msgCont.text, widget.roomId)
                            .then((onValue) {
                          setState(() {
                            msgCont.text = '';
                          });
                        });
                      }
                    },
                    icon: const Icon(Iconsax.send_1))
              ],
            )
          ],
        ),
      ),
    );
  }
}
