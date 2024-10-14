// import 'package:diva/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:diva/core/networking/dio_factory.dart';
import 'package:diva/features/home/data/apis/home_api_service.dart';
import 'package:diva/features/home/data/repos/home_repo.dart';
import 'package:diva/features/home/logic/home_cubit.dart';
import 'package:diva/features/login/data/apis/auth_api.dart';
import 'package:diva/features/login/data/repos/login_repos.dart';
import 'package:diva/features/login/logic/cubit/login_cubit.dart';
import 'package:diva/features/sign_up/data/api/sign_up_api.dart';
import 'package:diva/features/sign_up/data/repos/sign_up_repos.dart';
import 'package:diva/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  // getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit());

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register SignUpRepos, using the registered FirebaseAuth instance
  getIt.registerLazySingleton<SignUpRepos>(() => SignUpRepos(getIt()));

  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<LoginAPI>(() => LoginAPI(getIt()));

  getIt.registerLazySingleton<SignUpApi>(() => SignUpApi(getIt()));

  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(getIt()));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}
