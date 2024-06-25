import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/chat/presentation/view/chat_home_screen.dart';
import 'package:gluco/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:gluco/features/settings/presentation/view/profile_screen.dart';
import 'package:gluco/features/social/presentation/view/social_view.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:gluco/features/auth/data/auth.dart';

class GlucoLayout extends StatelessWidget {
  final Auth auth;
  final String? imagePath; // استلام مسار الصورة هنا

  const GlucoLayout({Key? key, required this.auth, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(imagePath: imagePath),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            imagePath != null ? FileImage(File(imagePath!)) : null,
                        child: imagePath == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialView(auth: auth),
                      ),
                    );
                  },
                  child: const Icon(Iconsax.facebook),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatHomeScreen(),
                      ),
                    );
                  },
                  child: const Icon(Iconsax.messages_1_copy),
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItem,
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
