import 'package:flutter/material.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/chat/data/msg_model.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class ChatMessageCard extends StatelessWidget {
  final int index;
  final MessageModel messageModel;
  const ChatMessageCard({
    super.key,
    required this.index,
    required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    final userId = ChachHelper.getData(key: 'id');
    bool isMe = messageModel.fromId == userId;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe
            ? IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.message_edit))
            : const SizedBox(),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
          )),
          color: isMe
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(messageModel.msg.toString()),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isMe
                          ? const Icon(
                              Iconsax.tick_circle,
                              color: Colors.blueAccent,
                              size: 18,
                            )
                          : const SizedBox(),
                      Text(
                        DateFormat.yMMMEd()
                            .format(DateTime.fromMicrosecondsSinceEpoch(
                                int.parse(messageModel.createdAt!)))
                            .toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
