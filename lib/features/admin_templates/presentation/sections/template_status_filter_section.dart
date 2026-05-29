import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/core/enum/templates_view_state.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/templates_bloc.dart';
import 'package:sizer/sizer.dart';

class TemplateStatusFilterSection extends StatelessWidget {
  const TemplateStatusFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemplatesBloc, TemplatesBlocState>(
      builder: (context, state) {
        if (state is TemplatesBlocStateLoaded) {
          return CupertinoSlidingSegmentedControl(
            groupValue: state.state,
            children: {
              TemplatesViewState.all: Text(
                'All',
                style: TextStyle(fontSize: 1.w),
              ),
              TemplatesViewState.activated: Text(
                'Activated',
                style: TextStyle(fontSize: 1.w),
              ),
              TemplatesViewState.deactivated: Text(
                'DeActivated',
                style: TextStyle(fontSize: 1.w),
              ),
            },
            onValueChanged: (value) {
              context.read<TemplatesBloc>().add(
                TemplatesBlocChangeViewState(state: value!),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
