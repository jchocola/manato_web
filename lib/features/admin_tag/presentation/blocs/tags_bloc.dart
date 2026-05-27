import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manato_web/features/admin_tag/data/tag_model.dart';
import 'package:manato_web/features/admin_tag/data/tag_repo_impl.dart';
import 'package:manato_web/features/admin_tag/domain/tag_repository.dart';
import 'package:manato_web/main.dart';

///
/// EVENT
///
abstract class TagsBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TagsBlocEventLoadTags extends TagsBlocEvent {}

class TagsBlocEventCreateTag extends TagsBlocEvent {
  final TagModel tag;
  TagsBlocEventCreateTag({required this.tag});

  @override
  List<Object?> get props => [tag];
}

class TagsBlocEventDeleteTag extends TagsBlocEvent {
  final TagModel tag;
  TagsBlocEventDeleteTag({required this.tag});

  @override
  List<Object?> get props => [tag];
}

class TagsBlocEventEditTag extends TagsBlocEvent {
  final TagModel modifiedTag;
  TagsBlocEventEditTag({required this.modifiedTag});

  @override
  List<Object?> get props => [modifiedTag];
}

///
/// STATE
///
abstract class TagsBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TagsBlocStateInitial extends TagsBlocState {}

class TagsBlocStateLoading extends TagsBlocState {}

class TagsBlocStateLoaded extends TagsBlocState {
  final List<TagModel> tags;

  TagsBlocStateLoaded({required this.tags});

  @override
  List<Object?> get props => [tags];
}

class TagsBlocStateError extends TagsBlocState {
  final String error;
  TagsBlocStateError({required this.error});
  @override
  List<Object?> get props => [error];
}

///
/// BLOC
///
class TagsBloc extends Bloc<TagsBlocEvent, TagsBlocState> {
  final TagRepository tagRepository;
  TagsBloc({required this.tagRepository}) : super(TagsBlocStateInitial()) {
    on<TagsBlocEventLoadTags>((event, emit) async {
      try {
        logger.i('load tag list');
        final taglist = await tagRepository.getTagList();
        emit(TagsBlocStateLoaded(tags: taglist));
      } catch (e) {
        emit(TagsBlocStateError(error: e.toString()));
      }
    });

    on<TagsBlocEventCreateTag>((event, emit) async {
      try {
        logger.i('create new  tag ');
        await tagRepository.createTag(tag: event.tag);
      } catch (e) {
        emit(TagsBlocStateError(error: e.toString()));
      } finally {
        add(TagsBlocEventLoadTags());
      }
    });

    on<TagsBlocEventDeleteTag>((event, emit) async {
      try {
        logger.i('Delete tag ');
        await tagRepository.deleteTag(tag: event.tag);
      } catch (e) {
        emit(TagsBlocStateError(error: e.toString()));
      } finally {
        add(TagsBlocEventLoadTags());
      }
    });

    on<TagsBlocEventEditTag>((event, emit) async {
      try {
        await tagRepository.updateTag(tag: event.modifiedTag);
      } catch (e) {
        emit(TagsBlocStateError(error: e.toString()));
      } finally {
        add(TagsBlocEventLoadTags());
      }
    });
  }
}
