// import 'package:diva/features/sign_up/logic/cubit/sign_up_cubit.dart';
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
  // Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit());

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register SignUpRepos, using the registered FirebaseAuth instance
  getIt.registerLazySingleton<SignUpRepos>(() => SignUpRepos(getIt()));

  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<LoginAPI>(() => LoginAPI(getIt()));

  getIt.registerLazySingleton<SignUpApi>(() => SignUpApi(getIt()));
}
