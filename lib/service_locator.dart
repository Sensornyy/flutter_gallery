import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network_info.dart';
import 'package:test_flutter/feature/data/data_source/remote_data_source.dart';
import 'package:test_flutter/feature/data/repository/gallery_repository_impl.dart';
import 'package:test_flutter/feature/domain/repository/gallery_repository.dart';
import 'package:test_flutter/feature/domain/use_case/get_photos.dart';
import 'package:test_flutter/feature/presentation/bloc/gallery/gallery_cubit.dart';

///sl - service locator
final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(() => GalleryCubit(getPhotos: sl()));

  ///Use case
  sl.registerLazySingleton(() => GetPhotos(sl()));

  ///Repository
  sl.registerLazySingleton<GalleryRepository>(
    () => GalleryRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<GalleryRemoteDataSource>(
      () => GalleryRemoteDataSourceImpl(client: http.Client()));

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
