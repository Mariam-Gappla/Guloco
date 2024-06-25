// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gluco/core/helper/cach.dart';
// import 'package:gluco/features/auth/data/auth.dart';
// import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
// import 'package:gluco/features/social/presentation/view/add_post_screen.dart';

// class SocialView extends StatefulWidget {
//   const SocialView({super.key, required this.auth});
//   final Auth auth;

//   @override
//   _SocialViewState createState() => _SocialViewState();
// }

// class _SocialViewState extends State<SocialView> {
//   Map<String, bool> likeStatus = {};
//   Map<String, int> likeCounts = {};

//   @override
//   void initState() {
//     super.initState();
//     _initializeLikeData();
//   }

//   Future<void> _initializeLikeData() async {
//     var cubit = SocialCubit.get(context);
//     cubit.getPosts();
//     if (cubit.socialModel != null) {
//       for (var post in cubit.socialModel!) {
//         String postId = post.id.toString();
//         likeStatus[postId] =
//             await ChachHelper.getLikeStatus(postId: postId) ?? false;
//         likeCounts[postId] = await ChachHelper.getLikes(postId: postId) ?? 0;
//       }
//       setState(() {});
//     }
//   }

//   Future<void> _toggleLike(String postId) async {
//     bool currentStatus = likeStatus[postId] ?? false;
//     int currentCount = likeCounts[postId] ?? 0;

//     setState(() {
//       likeStatus[postId] = !currentStatus;
//       likeCounts[postId] = currentStatus ? currentCount - 1 : currentCount + 1;
//     });

//     await ChachHelper.toggleLike(postId: postId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = SocialCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Social Gluco'),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.refresh),
//                 onPressed: () {
//                   cubit.getPosts();
//                   _initializeLikeData();
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddPostScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 100,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 15,
//                     itemBuilder: (context, index) {
//                       return const Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             child: CircleAvatar(
//                               radius: 35,
//                             ),
//                           ),
//                           Text('data'),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 state is GetSocialLoaded
//                     ? const Center(child: CircularProgressIndicator())
//                     : state is GetSocialError
//                         ? const Center(child: Text('Error loading posts'))
//                         : ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: cubit.socialModel?.length ?? 0,
//                             itemBuilder: (context, index) {
//                               final post = cubit.socialModel![index];
//                               String postId = post.id.toString();
//                               bool isLiked = likeStatus[postId] ?? false;
//                               int likeCount = likeCounts[postId] ?? 0;

//                               return Card(
//                                 margin: const EdgeInsets.all(8.0),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           const CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                               'https://via.placeholder.com/150',
//                                             ),
//                                             radius: 20,
//                                           ),
//                                           const SizedBox(width: 10),
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 widget.auth.username ??
//                                                     'Unknown User',
//                                                 style: const TextStyle(
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                               Text(
//                                                 post.createdAt?.toString() ??
//                                                     'Unknown',
//                                                 style: TextStyle(
//                                                     color: Colors.grey[600],
//                                                     fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                           const Spacer(),
//                                           const Spacer(),
//                                           PopupMenuButton<int>(
//                                             icon: const Icon(
//                                                 FontAwesomeIcons.ellipsis),
//                                             onSelected: (value) {
//                                               if (value == 1) {
//                                                 // منطق التعديل
//                                                 print('تعديل');
//                                               } else if (value == 2) {
//                                                 // منطق الحذف
//                                                 print('حذف');
//                                               }
//                                             },
//                                             itemBuilder: (context) => [
//                                               PopupMenuItem(
//                                                 value: 1,
//                                                 child: Row(
//                                                   children: const [
//                                                     Icon(Icons.edit,
//                                                         color: Colors.black),
//                                                     SizedBox(width: 8),
//                                                     Text('تعديل'),
//                                                   ],
//                                                 ),
//                                               ),
//                                               PopupMenuItem(
//                                                 value: 2,
//                                                 child: Row(
//                                                   children: const [
//                                                     Icon(Icons.delete,
//                                                         color: Colors.red),
//                                                     SizedBox(width: 8),
//                                                     Text('حذف'),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Text(
//                                         post.content ?? 'No Content',
//                                         style: const TextStyle(fontSize: 18),
//                                       ),
//                                       const SizedBox(height: 10),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               IconButton(
//                                                 icon: Icon(
//                                                   isLiked
//                                                       ? Icons.thumb_up
//                                                       : Icons
//                                                           .thumb_up_alt_outlined,
//                                                 ),
//                                                 onPressed: () {
//                                                   _toggleLike(postId);
//                                                 },
//                                               ),
//                                               Text('$likeCount'),
//                                             ],
//                                           ),
//                                           Row(
//                                             children: [
//                                               IconButton(
//                                                 icon: const Icon(
//                                                     Icons.comment_outlined),
//                                                 onPressed: () {
//                                                   // Logic for commenting on the post
//                                                 },
//                                               ),
//                                               const Text('Comment'),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/social/presentation/manager/get_posts/social_cubit.dart';
import 'package:gluco/features/social/presentation/view/add_post_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SocialView extends StatefulWidget {
  const SocialView({super.key, required this.auth});
  final Auth auth;

  @override
  _SocialViewState createState() => _SocialViewState();
}

class _SocialViewState extends State<SocialView> {
  Map<String, bool> likeStatus = {};
  Map<String, int> likeCounts = {};

  @override
  void initState() {
    super.initState();
    _initializeLikeData();
  }

  Future<void> _initializeLikeData() async {
    var cubit = SocialCubit.get(context);
    cubit.getPosts();
    // اجلب المشاركات قبل الوصول إلى بيانات الإعجابات
    if (cubit.socialModel != null) {
      for (var post in cubit.socialModel!) {
        String postId = post.id.toString();
        likeStatus[postId] =
            await ChachHelper.getLikeStatus(postId: postId) ?? false;
        likeCounts[postId] = await ChachHelper.getLikes(postId: postId) ?? 0;
      }
      setState(() {});
    }
  }

  Future<void> _toggleLike(String postId) async {
    bool currentStatus = likeStatus[postId] ?? false;
    int currentCount = likeCounts[postId] ?? 0;

    setState(() {
      likeStatus[postId] = !currentStatus;
      likeCounts[postId] = currentStatus ? currentCount - 1 : currentCount + 1;
    });

    await ChachHelper.toggleLike(postId: postId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Social Gluco'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  cubit.getPosts();
                  _initializeLikeData();
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPostScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: CircleAvatar(
                              radius: 35,
                            ),
                          ),
                          Text('data'),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                state is GetSocialLoaded
                    ? const Center(child: CircularProgressIndicator())
                    : state is GetSocialError
                        ? const Center(child: Text('Error loading posts'))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.socialModel?.length ?? 0,
                            itemBuilder: (context, index) {
                              final post = cubit.socialModel![index];
                              String postId = post.id.toString();
                              bool isLiked = likeStatus[postId] ?? false;
                              int likeCount = likeCounts[postId] ?? 0;

                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                margin: const EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              'https://via.placeholder.com/150',
                                            ),
                                            radius: 20,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.auth.username ??
                                                    'Unknown User',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                post.createdAt != null
                                                    ? DateFormat(
                                                            'yyyy-MM-dd – kk:mm')
                                                        .format(post.createdAt!)
                                                    : 'Unknown',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          PopupMenuButton<int>(
                                            icon: const Icon(
                                                FontAwesomeIcons.ellipsis),
                                            onSelected: (value) {
                                              if (value == 1) {
                                                // منطق التعديل
                                                print('تعديل');
                                              } else if (value == 2) {
                                                // منطق الحذف
                                                print('حذف');
                                              }
                                            },
                                            itemBuilder: (context) => [
                                              const PopupMenuItem(
                                                value: 1,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.edit,
                                                        color: Colors.black),
                                                    SizedBox(width: 8),
                                                    Text('تعديل'),
                                                  ],
                                                ),
                                              ),
                                              const PopupMenuItem(
                                                value: 2,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.delete,
                                                        color: Colors.red),
                                                    SizedBox(width: 8),
                                                    Text('حذف'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        post.content ?? 'No Content',
                                        style: const TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  isLiked
                                                      ? Icons.thumb_up
                                                      : Icons
                                                          .thumb_up_alt_outlined,
                                                ),
                                                onPressed: () {
                                                  _toggleLike(postId);
                                                },
                                              ),
                                              Text('$likeCount'),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.comment_outlined),
                                                onPressed: () {
                                                  // Logic for commenting on the post
                                                },
                                              ),
                                              const Text('Comment'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ],
            ),
          ),
        );
      },
    );
  }
}
