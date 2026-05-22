import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_event.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:manato_web/features/admin/presentation/data/models/user_model.dart';
import 'package:manato_web/features/admin/presentation/domain/auth_repository.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final AuthRepository authRepository;
  UserBloc({required this.authRepository})
    : super(UserBlocStateUnauthenticated()) {
    on<UserBlocEventLoadUser>(_loadUser);
    on<UserBlocEventLogin>(_login);
    on<UserBlocEventLogOut>(_logOut);
  }

  Future<void> _loadUser(
    UserBlocEventLoadUser event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      final user = await authRepository.getCurrentUser();
      final userModel = UserModel(id: 'e', role: Role.admin);

      if (userModel != null && user != null) {
        emit(UserBlocStateAuthenticated(user: user, userModel: userModel));
      } else {
        emit(UserBlocStateUnauthenticated());
      }
    } catch (e) {
      emit(UserBlocStateError(error: e.toString()));
    }
  }

  Future<void> _login(
    UserBlocEventLogin event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      await authRepository.logIn(email: event.email, password: event.password);
    } catch (e) {
      emit(UserBlocStateError(error: e.toString()));
    } finally {
      add(UserBlocEventLoadUser());
    }
  }

  Future<void> _logOut(
    UserBlocEventLogOut event,
    Emitter<UserBlocState> emit,
  ) async {
    try {
      await authRepository.logOut();
    } catch (e) {
      emit(UserBlocStateError(error: e.toString()));
    } finally {
      add(UserBlocEventLoadUser());
    }
  }
}
