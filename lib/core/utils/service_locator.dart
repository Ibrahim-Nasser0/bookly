import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<HomeRepoImpl>(
    () => HomeRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
