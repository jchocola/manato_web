import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:manato_web/features/admin/presentation/widgets/sign_in_first_widget.dart';

class TemplatesPage extends StatelessWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserBlocStateAuthenticated) {
          return Text('Is admin');
        } else {
          return SignInFirstWidget();
        }
      },
    );
  }
}
