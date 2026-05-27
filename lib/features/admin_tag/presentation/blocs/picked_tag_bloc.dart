import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:manato_web/features/admin_tag/data/tag_model.dart';
import 'package:manato_web/features/admin_tag/domain/tag_repository.dart';
import 'package:manato_web/main.dart';

///
/// EVENT
///
abstract class PickedTagBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickedTagBlocEventPickedEditingTag extends PickedTagBlocEvent {
  final TagModel tag;
  PickedTagBlocEventPickedEditingTag({required this.tag});

  @override
  List<Object?> get props => [tag];
}


///
///BLOC
///
abstract class PickedTagBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickedTagBlocStateInitial extends PickedTagBlocState {}

class PickedTagBlocStatePicked extends PickedTagBlocState {
  final TagModel tag;
  final List<TemplateModel>? templates;
  PickedTagBlocStatePicked({required this.tag, this.templates});

  @override
  List<Object?> get props => [tag, templates];
}

class PickedTagBlocStateError extends PickedTagBlocState {
  final String error;
  PickedTagBlocStateError({required this.error});

  @override
  List<Object?> get props => [error];
}

///
/// BLOC
///

class PickedTagBloc extends Bloc<PickedTagBlocEvent, PickedTagBlocState> {
  final TagRepository tagRepository;
  PickedTagBloc({required this.tagRepository})
    : super(PickedTagBlocStateInitial()) {
    on<PickedTagBlocEventPickedEditingTag>((event, emit) async {
      emit(PickedTagBlocStatePicked(tag: event.tag));
    });

   
  }
}
