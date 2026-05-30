import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/features/admin_templates/presentation/blocs/create_template_bloc.dart';
import 'package:manato_web/shared/widgets/custom_textarea.dart';
import 'package:manato_web/shared/widgets/parameter_card.dart';
import 'package:manato_web/shared/widgets/picked_image_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizer/sizer.dart';

class ContentPromptSection extends StatelessWidget {
  const ContentPromptSection({super.key});

  @override
  Widget build(BuildContext context) {
    final createTemplateBloc = context.read<CreateTemplateBloc>();
    return ShadCard(
      child: Column(
        spacing: 1.w,
        crossAxisAlignment: .start,
        children: [
          Text('Content & Prompt'),

          // Prompt
          CustomTextArea(
            title: 'Prompt',
            controller: createTemplateBloc.promptController,
          ),

          // BEFOR AFTER THUMBNAIL
          BlocBuilder<CreateTemplateBloc, CreateTemplateBlocState>(
            builder: (context, state) {
              if (state is CreateTemplateBlocStateInitial) {
                return Row(
                  spacing: 1.w,
                  mainAxisAlignment: .spaceAround,
                  children: [
                    PickedImageCard(
                      title: 'Before',
                      pickedImage: state.beforeImageBytes,
                      onPressed: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventPickBeforeImage(),
                      ),
                      onDoubleTap: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventRemovePickBeforeImage(),
                      ),
                    ),
                    PickedImageCard(
                      title: 'After',
                      pickedImage: state.afterImageBytes,
                       onPressed: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventPickAfterImage(),
                      ),
                       onDoubleTap: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventRemovePickAfterImage(),
                      ),
                    ),
                    PickedImageCard(
                      title: 'Thumbnail',
                      pickedImage: state.thumbnailImageBytes,
                       onPressed: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventPickThumbnailImage(),
                      ),
                       onDoubleTap: () => context.read<CreateTemplateBloc>().add(
                        CreateTemplateBlocEventRemovePickThumbnailImage(),
                      ),
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 1.w,
                    mainAxisAlignment: .spaceAround,
                    children: [
                      PickedImageCard(title: 'Before'),
                      PickedImageCard(title: 'After'),
                      PickedImageCard(title: 'Thumbnail'),
                    ],
                  ),
                );
              }
            },
          ),

          Row(
            mainAxisAlignment: .spaceBetween,
            spacing: 1.w,
            children: [
              Text('Parameters'),
              Expanded(
                flex: 1,
                child: ShadInput(
                  controller: createTemplateBloc.parameterKeyController,
                ),
              ),
              Expanded(
                flex: 2,
                child: ShadInput(
                  controller: createTemplateBloc.parameterValueController,
                ),
              ),
              ShadButton.destructive(
                child: Icon(Icons.add),
                onPressed: () => createTemplateBloc.add(
                  CreateTemplateBlocEventAddParameter(),
                ),
              ),
            ],
          ),

          ParametersSection(),
        ],
      ),
    );
  }
}

class ParametersSection extends StatelessWidget {
  const ParametersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      CreateTemplateBloc,
      CreateTemplateBlocState,
      Map<String, String>
    >(
      selector: (state) {
        if (state is CreateTemplateBlocStateInitial) {
          return state.parameters;
        }
        return {};
      },
      builder: (context, state) {
        return Column(
          spacing: 1.w,
          children: List.generate(
            state.length,
            (index) => ParameterCard(
              
              onPressed: () => context.read<CreateTemplateBloc>().add(
                CreateTemplateBlocEventRemoveParameter(
                  key: state.keys.elementAt(index),
                ),
              ),
              key: ValueKey(state.keys.elementAt(index)),
              parameterKey: state.keys.elementAt(index),
              parameterValue: state.values.elementAt(index),
              index: index,
            ),
          ),
        );
      },
    );
  }
}
