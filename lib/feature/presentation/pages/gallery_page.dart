import 'package:flutter/material.dart';

import 'package:test_flutter/feature/presentation/widgets/gallery.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Gallery(),
      backgroundColor: const Color(0xFF24282F),
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3B3B4B),
      ),
    );
  }
}
