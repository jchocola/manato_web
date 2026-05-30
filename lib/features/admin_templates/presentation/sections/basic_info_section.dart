import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/create_template_bloc.dart';
import 'package:manato_web/shared/widgets/custom_input.dart';
import 'package:manato_web/shared/widgets/custom_textarea.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class BasicInfoSection extends StatelessWidget {
  const BasicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final createTemplateBloc = context.read<CreateTemplateBloc>();
    final createTemplateBlocListener = context.watch<CreateTemplateBloc>();
    return ShadCard(
      child: Column(
        spacing: 1.w,
        crossAxisAlignment: .start,
        children: [
          Text('Basic Information'),
          Row(
            spacing: 1.w,
            children: [
              // TEMPLATE NAME
              Expanded(
                child: CustomInput(
                  title: 'Template Name',
                  controller: createTemplateBloc.templateName,
                ),
              ),

              //TEMPLATE ID
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: CustomInput(
                        title: 'Template ID',
                        controller: createTemplateBloc.templateId,
                      ),
                    ),
                    ShadButton.ghost(
                      child: Icon(Icons.grid_goldenratio_rounded),
                      onPressed: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventGenerateId(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // DESCRIPTION
          CustomTextArea(
            title: 'Description',
            controller: createTemplateBloc.templateDescription,
          ),

          // TAG
          Row(
            crossAxisAlignment: .end,
            children: [
              Flexible(
                child: CustomInput(
                  title: 'Tags',
                  controller: createTemplateBloc.tagController,
                ),
              ),
              ShadButton.ghost(
                child: Icon(Icons.add),
                onPressed: () {
                  context.read<CreateTemplateBloc>().add(
                    CreateTemplateBlocEventAddTag(),
                  );
                },
              ),
            ],
          ),

          BlocSelector<
            CreateTemplateBloc,
            CreateTemplateBlocState,
            List<String>
          >(
            selector: (state) {
              if (state is CreateTemplateBlocStateInitial) {
                return state.tags;
              }
              return [];
            },
            builder: (context, tags) {
              return Wrap(
                spacing: 1.w,
                children: tags
                    .map((tag) => Chip(
                          label: Text(tag),
                          onDeleted: () {
                           context.read<CreateTemplateBloc>().add(
                              CreateTemplateBlocEventRemoveTag(
                                index: tags.indexOf(tag),
                              ),
                            );
                          },
                        ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
