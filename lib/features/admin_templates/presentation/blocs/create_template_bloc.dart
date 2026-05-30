import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manato_web/core/utils/id_gererator.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:manato_web/features/admin_templates/domain/storage_repository.dart';
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

class CreateTemplateBlocEventPickBeforeImage extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventPickAfterImage extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventPickThumbnailImage
    extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventRemovePickBeforeImage
    extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventRemovePickAfterImage
    extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventRemovePickThumbnailImage
    extends CreateTemplateBlocEvent {}

class CreateTemplateBlocEventSetCategory extends CreateTemplateBlocEvent {
  final String categoryId;

  CreateTemplateBlocEventSetCategory({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}   

class CreateTemplateBlocEventSetSpecialTag extends CreateTemplateBlocEvent {
  final String specialTagId;

  CreateTemplateBlocEventSetSpecialTag({required this.specialTagId});
  @override
  List<Object?> get props => [specialTagId];
}

class CreateTemplateBlocEventSetRating extends CreateTemplateBlocEvent {
  final String rating;

  CreateTemplateBlocEventSetRating({required this.rating});
  @override
  List<Object?> get props => [rating];
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
  final Uint8List? thumbnailImageBytes;
  final Uint8List? beforeImageBytes;
  final Uint8List? afterImageBytes;
  CreateTemplateBlocStateInitial({
    this.tags = const [],
    this.parameters = const {},
    this.thumbnailImageBytes,
    this.beforeImageBytes,
    this.afterImageBytes,
  });

  @override
  List<Object?> get props => [
    tags,
    parameters,
    thumbnailImageBytes,
    beforeImageBytes,
    afterImageBytes,
  ];

  CreateTemplateBlocStateInitial copyWith({
    List<String>? tags,
    Map<String, String>? parameters,
    Object? thumbnailImageBytes = _copyWithSentinel,
    Object? beforeImageBytes = _copyWithSentinel,
    Object? afterImageBytes = _copyWithSentinel,
  }) {
    return CreateTemplateBlocStateInitial(
      tags: tags ?? this.tags,
      parameters: parameters ?? this.parameters,
      thumbnailImageBytes: identical(thumbnailImageBytes, _copyWithSentinel)
          ? this.thumbnailImageBytes
          : thumbnailImageBytes as Uint8List?,
      beforeImageBytes: identical(beforeImageBytes, _copyWithSentinel)
          ? this.beforeImageBytes
          : beforeImageBytes as Uint8List?,
      afterImageBytes: identical(afterImageBytes, _copyWithSentinel)
          ? this.afterImageBytes
          : afterImageBytes as Uint8List?,
    );
  }
}

const _copyWithSentinel = Object();

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
  final TextEditingController parameterValueController =
      TextEditingController();
  final TextEditingController usedCountController = TextEditingController();

  String? selectedCategoryId;
  String? selectedSpecialTagId;
  String? rating;

  List<String> tags = [];
  Map<String, String> parameters = {};

  final TemplateRepository templateRepository;
  final StorageRepository storageRepository;
  CreateTemplateBloc({
    required this.templateRepository,
    required this.storageRepository,
  }) : super(CreateTemplateBlocStateInitial()) {
    on<CreateTemplateBlocEventCreateTemplate>((event, emit) async {
      try {
        logger.i('Create new template');

        final id = templateId.text;
        String? thumbnailUrl;
        String? beforeImageUrl;
        String? afterImageUrl;

        if (state is CreateTemplateBlocStateInitial) {
          final currentState = state as CreateTemplateBlocStateInitial;
          if (currentState.thumbnailImageBytes != null) {
            thumbnailUrl = await storageRepository
                .uploadImageToStorageReturnDownloadUrl(
                  bytes: currentState.thumbnailImageBytes!,
                  folder: 'Templates',
                  id: id,
                );
          }

           if (currentState.beforeImageBytes != null) {
            beforeImageUrl = await storageRepository
                .uploadImageToStorageReturnDownloadUrl(
                  bytes: currentState.beforeImageBytes!,
                  folder: 'Templates',
                  id: id,
                );
          }

           if (currentState.afterImageBytes != null) {
            afterImageUrl = await storageRepository
                .uploadImageToStorageReturnDownloadUrl(
                  bytes: currentState.afterImageBytes!,
                  folder: 'Templates',
                  id: id,
                );
          }
        }

    

        final TemplateModel template = TemplateModel(
          id: id,
          title: templateName.text,
          subtitle: templateDescription.text,
          rating: double.tryParse(rating ?? '5') ?? 5,
          used: int.tryParse(usedCountController.text) ?? 0,
          tags: tags,
          parameters: parameters,
          prompt: promptController.text,
          thumbnailImageUrl: thumbnailUrl,
          beforeImageUrl: beforeImageUrl,
          afterImageUrl: afterImageUrl,
          category: selectedCategoryId ?? '',
          specialTag: selectedSpecialTagId ?? '',
          
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

      emit(
        CreateTemplateBlocStateInitial(
          tags: List.from(tags),
          parameters: Map.from(parameters),
          thumbnailImageBytes:
              (state as CreateTemplateBlocStateInitial).thumbnailImageBytes,
          beforeImageBytes:
              (state as CreateTemplateBlocStateInitial).beforeImageBytes,
          afterImageBytes:
              (state as CreateTemplateBlocStateInitial).afterImageBytes,
        ),
      );
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
        emit(
          CreateTemplateBlocStateInitial(
            tags: newTags,
            parameters: Map.from(parameters),
            thumbnailImageBytes:
                (state as CreateTemplateBlocStateInitial).thumbnailImageBytes,
            beforeImageBytes:
                (state as CreateTemplateBlocStateInitial).beforeImageBytes,
            afterImageBytes:
                (state as CreateTemplateBlocStateInitial).afterImageBytes,
          ),
        );
      }
    });

    on<CreateTemplateBlocEventRemoveTag>((event, emit) {
      logger.i('Remove tag');
      if (event.index >= 0 && event.index < tags.length) {
        tags.removeAt(event.index);
        final newTags = List<String>.from(tags);
        emit(
          CreateTemplateBlocStateInitial(
            tags: newTags,
            parameters: Map.from(parameters),
            thumbnailImageBytes:
                (state as CreateTemplateBlocStateInitial).thumbnailImageBytes,
            beforeImageBytes:
                (state as CreateTemplateBlocStateInitial).beforeImageBytes,
            afterImageBytes:
                (state as CreateTemplateBlocStateInitial).afterImageBytes,
          ),
        );
      }
    });

    on<CreateTemplateBlocEventAddParameter>((event, emit) {
      logger.i('Add parameter');
      if (parameterKeyController.text.isNotEmpty &&
          parameterValueController.text.isNotEmpty) {
        parameters[parameterKeyController.text] = parameterValueController.text;
        logger.i('Current parameters: $parameters');
        parameterKeyController.clear();
        parameterValueController.clear();
        final newParameters = Map<String, String>.from(parameters);
        emit(
          CreateTemplateBlocStateInitial(
            tags: List.from(tags),
            parameters: newParameters,
            thumbnailImageBytes:
                (state as CreateTemplateBlocStateInitial).thumbnailImageBytes,
            beforeImageBytes:
                (state as CreateTemplateBlocStateInitial).beforeImageBytes,
            afterImageBytes:
                (state as CreateTemplateBlocStateInitial).afterImageBytes,
          ),
        );
      }
    });

    on<CreateTemplateBlocEventRemoveParameter>((event, emit) {
      logger.i('Remove parameter');
      parameters.remove(event.key);
      final newParameters = Map<String, String>.from(parameters);
      emit(
        CreateTemplateBlocStateInitial(
          tags: List.from(tags),
          parameters: newParameters,
        ),
      );
    });

    on<CreateTemplateBlocEventPickBeforeImage>((event, emit) async {
      logger.i('Pick before image');
      FilePickerResult? result = await FilePicker.pickFiles(
        allowMultiple: false,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        // FilePicker with `withData: true` returns bytes on web and native.
        final Uint8List? bytes = result.files.first.bytes;

        final newState = (state as CreateTemplateBlocStateInitial).copyWith(
          beforeImageBytes: bytes,
        );
        emit(newState);
      }
    });

    on<CreateTemplateBlocEventPickAfterImage>((event, emit) async {
      logger.i('Pick after image');
      FilePickerResult? result = await FilePicker.pickFiles(
        allowMultiple: false,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        // FilePicker with `withData: true` returns bytes on web and native.
        final Uint8List? bytes = result.files.first.bytes;

        final newState = (state as CreateTemplateBlocStateInitial).copyWith(
          afterImageBytes: bytes,
        );
        emit(newState);
      }
    });

    on<CreateTemplateBlocEventPickThumbnailImage>((event, emit) async {
      logger.i('Pick thumbnail image');
      FilePickerResult? result = await FilePicker.pickFiles(
        allowMultiple: false,
        withData: true,
      );
      if (result != null && result.files.isNotEmpty) {
        // FilePicker with `withData: true` returns bytes on web and native.
        final Uint8List? bytes = result.files.first.bytes;

        final newState = (state as CreateTemplateBlocStateInitial).copyWith(
          thumbnailImageBytes: bytes,
        );
        emit(newState);
      }
    });

    on<CreateTemplateBlocEventRemovePickBeforeImage>((event, emit) {
      logger.i('Remove picked before image');
      final newState = (state as CreateTemplateBlocStateInitial).copyWith(
        beforeImageBytes: null,
      );
      emit(newState);
    });

    on<CreateTemplateBlocEventRemovePickAfterImage>((event, emit) {
      logger.i('Remove picked after image');
      final newState = (state as CreateTemplateBlocStateInitial).copyWith(
        afterImageBytes: null,
      );
      emit(newState);
    });

    on<CreateTemplateBlocEventRemovePickThumbnailImage>((event, emit) {
      logger.i('Remove picked thumbnail image');
      final newState = (state as CreateTemplateBlocStateInitial).copyWith(
        thumbnailImageBytes: null,
      );
      emit(newState);
    });

    on<CreateTemplateBlocEventSetCategory>((event, emit) {
      logger.i('Set category: ${event.categoryId}');
      selectedCategoryId = event.categoryId;
    });

    on<CreateTemplateBlocEventSetSpecialTag>((event, emit) {
      logger.i('Set special tag: ${event.specialTagId}');
      selectedSpecialTagId = event.specialTagId;
    });

    on<CreateTemplateBlocEventSetRating>((event, emit) {
      logger.i('Set rating: ${event.rating}');
      rating = event.rating;
    });
  }

  @override
  Future<void> close() {
    templateName.dispose();
    templateId.dispose();
    templateDescription.dispose();
    promptController.dispose();
    tagController.dispose();
    usedCountController.dispose();
    parameterKeyController.dispose();
    parameterValueController.dispose();
    return super.close();
  }
}
