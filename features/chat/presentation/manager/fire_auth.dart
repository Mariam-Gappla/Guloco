import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/chat/data/user_model.dart';

class FireAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(Auth auth) async {
    final userId = ChachHelper.getData(key: 'id');
    ChatUser chatUser = ChatUser(
        id: userId,
        name: auth.username ,
        about: 'hello , iam using taha',
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        email: auth.email ?? '',
        image: '',
        lastActivated: DateTime.now().millisecondsSinceEpoch.toString(),
        online: false,
        pushToken: auth.token ?? '');
    await _firestore.collection('users').doc(userId).set(chatUser.toJson());
  }
}

