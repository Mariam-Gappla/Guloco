import 'package:flutter/material.dart';

class FavouriteBool extends StatefulWidget {
  const FavouriteBool({super.key});

  @override
  State<FavouriteBool> createState() => _FavouriteBoolState();
}

bool isFavorite = false;

class _FavouriteBoolState extends State<FavouriteBool> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: const Color(0xFF000000),
        radius: 15,
        child: IconButton(
          icon: isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: Colors.white,
          iconSize: 15,
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        ),
      ),
    );
  }
}
