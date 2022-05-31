import 'package:flutter/material.dart';

import 'package:test_flutter/feature/domain/entity/photo_entity.dart';

class ProfilePhotoPage extends StatelessWidget {
  final PhotoEntity photo;

  const ProfilePhotoPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24282F),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(photo.full, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
