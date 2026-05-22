import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/core/utils/show_snack_bar.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_event.dart';
import 'package:manato_web/features/admin/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class SignInFirstWidget extends StatefulWidget {
  const SignInFirstWidget({super.key});

  @override
  State<SignInFirstWidget> createState() => _SignInFirstWidgetState();
}

class _SignInFirstWidgetState extends State<SignInFirstWidget> {
  final emailConroller = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailConroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserBlocState>(
      listener: (context, state) {
        if (state is UserBlocStateError) {
          showCustomSnackbar(context, title: state.error);
        }
      },

      child: ShadCard(
        height: 40.h,
        width: 40.w,
        footer: ShadButton(
          child: Text('Sign In'),
          onPressed: () {
            context.read<UserBloc>().add(
              UserBlocEventLogin(
                email: emailConroller.text,
                password: passwordController.text,
              ),
            );
          },
        ),
        title: Text('Please sign in first'),
        child: Column(
          spacing: 1.w,
          children: [
            ShadInput(controller: emailConroller, placeholder: Text('Email'),),
            ShadInput(controller: passwordController , placeholder: Text('Password'),),
          ],
        ),
      ),
      // child: SizedBox(
      //   width: 50.w,
      //   height: 50.h,
      //   child: Card(
      //     child: Padding(
      //       padding: .all(2.w),
      //       child: Column(
      //         mainAxisSize: .min,
      //         children: [
      //           Text('Please sign in first'),
      //           Flexible(child: CustomTextFields(controller: emailConroller)),
      //           Flexible(
      //             child: CustomTextFields(controller: passwordController),
      //           ),
      //           ElevatedButton(
      //             onPressed: () {
      //               context.read<UserBloc>().add(
      //                 UserBlocEventLogin(
      //                   email: emailConroller.text,
      //                   password: passwordController.text,
      //                 ),
      //               );
      //             },
      //             child: Text('Sign In'),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
