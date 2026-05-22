import 'package:get_it/get_it.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/data/repo/firebase_auth_repo_impl.dart';
import 'package:manato_web/features/admin/presentation/domain/auth_repository.dart';

final sl = GetIt.instance;
Future<void> DI() async {
  ///
  /// REPOSITORIES
  ///

  sl.registerSingleton<AuthRepository>(FirebaseAuthRepoImpl());

  ///
  /// BLOCS
  ///
  sl.registerLazySingleton<UserBloc>(() => UserBloc(authRepository: sl<AuthRepository>()));
}
