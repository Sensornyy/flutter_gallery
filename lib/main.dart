import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/presentation/pages/gallery_page.dart';
import 'package:test_flutter/feature/presentation/bloc/gallery/gallery_cubit.dart';
import 'package:test_flutter/service_locator.dart' as di;
import 'package:test_flutter/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GalleryCubit>(
      create: (context) => sl<GalleryCubit>()..loadPhotos(),
      child: const MaterialApp(
        home: GalleryPage(),
      ),
    );
  }
}
