import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/data/repo/firebase_auth_repo_impl.dart';
import 'package:manato_web/features/admin/presentation/domain/auth_repository.dart';
import 'package:manato_web/features/admin_category/data/category_repo_impl.dart';
import 'package:manato_web/features/admin_category/domain/category_repository.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_bloc.dart';
import 'package:manato_web/features/admin_category/presentation/blocs/category_info_bloc.dart';
import 'package:manato_web/features/admin_tag/data/tag_repo_impl.dart';
import 'package:manato_web/features/admin_tag/domain/tag_repository.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/picked_tag_bloc.dart';
import 'package:manato_web/features/admin_tag/presentation/blocs/tags_bloc.dart';
import 'package:manato_web/features/admin_templates/data/template_repo_impl.dart';
import 'package:manato_web/features/admin_templates/domain/template_repository.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/templates_bloc.dart';
import 'package:manato_web/firebase_options.dart';

final sl = GetIt.instance;
Future<void> DI() async {
  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    sslEnabled: true,
    persistenceEnabled: false,
    webExperimentalForceLongPolling: true,
  );

  final firestore = FirebaseFirestore.instanceFor(
    app: firebaseApp,
    databaseId: 'default', // Имя вашей базы без скобок
  );

  ///
  /// REPOSITORIES
  ///

  sl.registerSingleton<AuthRepository>(FirebaseAuthRepoImpl());
  sl.registerSingleton<CategoryRepository>(
    CategoryRepoImpl(firestoreRef: firestore.collection('Categories')),
  );

  sl.registerSingleton<TagRepository>(
    TagRepoImpl(tagStoreRef: firestore.collection('Tags')),
  );

   sl.registerSingleton<TemplateRepository>(
    TemplateRepoImpl(templateRef: firestore.collection('Templates')),
  );

  ///
  /// BLOCS
  ///
  sl.registerLazySingleton<UserBloc>(
    () => UserBloc(authRepository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton<CategoryBloc>(
    () => CategoryBloc(categoryRepository: sl<CategoryRepository>()),
  );

  sl.registerLazySingleton<CategoryInfoBloc>(
    () => CategoryInfoBloc(categoryRepository: sl<CategoryRepository>()),
  );

  sl.registerLazySingleton<TagsBloc>(
    () => TagsBloc(tagRepository: sl<TagRepository>()),
  );

  sl.registerLazySingleton<PickedTagBloc>(
    () => PickedTagBloc(tagRepository: sl<TagRepository>()),
  );

  sl.registerLazySingleton<TemplatesBloc>(
    () => TemplatesBloc(templateRepository: sl<TemplateRepository>()),
  );
}
