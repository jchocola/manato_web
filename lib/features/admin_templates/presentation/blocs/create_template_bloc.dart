import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manato_web/core/utils/id_gererator.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:manato_web/features/admin_templates/domain/template_repository.dart';
import 'package:manato_web/main.dart';

///
/// EVENT
///
abstract class CreateTemplateBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTemplateBlocEventCreateTemplate extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventResetValues extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventGenerateId extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventAddTag extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventRemoveTag extends CreateTemplateBlocEvent {
  final int index;

  CreateTemplateBlocEventRemoveTag({required this.index});
  @override
  List<Object?> get props => [index];
}

class CreateTemplateBlocEventAddParameter extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventRemoveParameter extends CreateTemplateBlocEvent {
  final String key;

  CreateTemplateBlocEventRemoveParameter({required this.key});
  @override
  List<Object?> get props => [key];
}

///
/// STATE
///
abstract class CreateTemplateBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTemplateBlocStateInitial extends CreateTemplateBlocState {
  final List<String> tags;
  final Map<String, String> parameters;
  CreateTemplateBlocStateInitial({this.tags = const [], this.parameters = const {}});

  @override
  List<Object?> get props => [tags, parameters];
}

///
/// BLOC
///
class CreateTemplateBloc
    extends Bloc<CreateTemplateBlocEvent, CreateTemplateBlocState> {
  final TextEditingController templateName = TextEditingController();
  final TextEditingController templateId = TextEditingController();
  final TextEditingController templateDescription = TextEditingController();
  final TextEditingController promptController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController parameterKeyController = TextEditingController();
  final TextEditingController parameterValueController = TextEditingController();

  List<String> tags = [];
  Map<String, String> parameters = {};

  final TemplateRepository templateRepository;
  CreateTemplateBloc({required this.templateRepository})
    : super(CreateTemplateBlocStateInitial()) {
    on<CreateTemplateBlocEventCreateTemplate>((event, emit) async {
      try {
        logger.i('Create new template');
        final TemplateModel template = TemplateModel(
          id: templateId.text,
          title: templateName.text,
          subtitle: templateDescription.text,
          rating: 5,
          used: 0,
          tags: tags,
          parameters: parameters,
          prompt: promptController.text,
          thumbnailImageUrl: '',
          beforeImageUrl: '',
          afterImageUrl: '',
          category: '',
        );
        await templateRepository.createTemplate(model: template);
      } catch (e) {
        logger.e(e);
      }
    });

    on<CreateTemplateBlocEventResetValues>((event, emit) {
      logger.i('Reset values');
      templateName.clear();
      templateId.clear();
      templateDescription.clear();
      promptController.clear();
      tagController.clear();
      tags.clear();
      parameters.clear();
      parameterKeyController.clear();
      parameterValueController.clear();

      emit(CreateTemplateBlocStateInitial(tags: List.from(tags), parameters: Map.from(parameters)));
    });

    on<CreateTemplateBlocEventGenerateId>((event, emit) {
      logger.i('Generate template ID');
      templateId.text = IDGenerator();
   
    });

    on<CreateTemplateBlocEventAddTag>((event, emit) {
      logger.i('Add tag');
      if (tagController.text.isNotEmpty) {
        tags.add(tagController.text);
        logger.i('Current tags: $tags');
        tagController.clear();
        final newTags = List<String>.from(tags);
        emit(CreateTemplateBlocStateInitial(tags: newTags , parameters: Map.from(parameters)));
      }
    });

    on<CreateTemplateBlocEventRemoveTag>((event, emit) {
      logger.i('Remove tag');
      if (event.index >= 0 && event.index < tags.length) {
        tags.removeAt(event.index);
        final newTags = List<String>.from(tags);
        emit(CreateTemplateBlocStateInitial(tags: newTags , parameters: Map.from(parameters)));
      }
    });

    on<CreateTemplateBlocEventAddParameter>((event, emit) {
      logger.i('Add parameter');
      if (parameterKeyController.text.isNotEmpty && parameterValueController.text.isNotEmpty) {
        parameters[parameterKeyController.text] = parameterValueController.text;
        logger.i('Current parameters: $parameters');
        parameterKeyController.clear();
        parameterValueController.clear();
        final newParameters = Map<String, String>.from(parameters);
        emit(CreateTemplateBlocStateInitial(tags: List.from(tags), parameters: newParameters));
      }
    });

    on<CreateTemplateBlocEventRemoveParameter>((event, emit) {
      logger.i('Remove parameter');
      parameters.remove(event.key);
      final newParameters = Map<String, String>.from(parameters);
      emit(CreateTemplateBlocStateInitial(tags: List.from(tags), parameters: newParameters));
    });
  }

  @override
  Future<void> close() {
    templateName.dispose();
    templateId.dispose();
    templateDescription.dispose();
    promptController.dispose();
    tagController.dispose();
    return super.close();
  }
}
