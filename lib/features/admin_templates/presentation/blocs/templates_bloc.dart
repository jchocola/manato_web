import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manato_web/core/enum/templates_view_state.dart';
import 'package:manato_web/features/admin/presentation/data/models/template_model.dart';
import 'package:manato_web/features/admin_templates/domain/template_repository.dart';
import 'package:manato_web/main.dart';

///
/// EVENT
///
abstract class TemplatesBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TemplatesBlocEventCreateTemplate extends TemplatesBlocEvent {
  final TemplateModel template;
  TemplatesBlocEventCreateTemplate({required this.template});

  @override
  List<Object?> get props => [template];
}

class TemplatesBlocEventActivateTemplate extends TemplatesBlocEvent {
  final TemplateModel template;
  TemplatesBlocEventActivateTemplate({required this.template});

  @override
  List<Object?> get props => [template];
}

class TemplatesBlocEventDeActivateTemplate extends TemplatesBlocEvent {
  final TemplateModel template;
  TemplatesBlocEventDeActivateTemplate({required this.template});

  @override
  List<Object?> get props => [template];
}

class TemplatesBlocEventToogleVisibleTemplate extends TemplatesBlocEvent {
  final TemplateModel template;
  TemplatesBlocEventToogleVisibleTemplate({required this.template});

  @override
  List<Object?> get props => [template];
}

class TemplatesBlocEventDeleteTemplate extends TemplatesBlocEvent {
  final TemplateModel template;
  TemplatesBlocEventDeleteTemplate({required this.template});

  @override
  List<Object?> get props => [template];
}

class TemplatesBlocEventEditTemplate extends TemplatesBlocEvent {
  final TemplateModel template;
  TemplatesBlocEventEditTemplate({required this.template});

  @override
  List<Object?> get props => [template];
}

class TemplatesBlocLoadTemplates extends TemplatesBlocEvent {}

class TemplatesBlocChangeViewState extends TemplatesBlocEvent {
  final TemplatesViewState state;
  TemplatesBlocChangeViewState({required this.state});

  @override
  List<Object?> get props => [state];
}

///
/// STATE
///
abstract class TemplatesBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TemplatesBlocStateInitial extends TemplatesBlocState {}

class TemplatesBlocStateloading extends TemplatesBlocState {}

class TemplatesBlocStateLoaded extends TemplatesBlocState {
  final List<TemplateModel> allList;
  final List<TemplateModel> activatedList;
  final List<TemplateModel> deactivatedList;
  final TemplatesViewState state;
  TemplatesBlocStateLoaded({
    required this.allList,
    required this.activatedList,
    required this.deactivatedList,
    this.state = TemplatesViewState.all,
  });

  @override
  List<Object?> get props => [allList, activatedList, deactivatedList, state];

  TemplatesBlocStateLoaded copyWith({
    List<TemplateModel>? allList,
    List<TemplateModel>? activatedList,
    List<TemplateModel>? deactivatedList,
    TemplatesViewState? state,
  }) {
    return TemplatesBlocStateLoaded(
      allList: allList ?? this.allList,
      activatedList: activatedList ?? this.activatedList,
      deactivatedList: deactivatedList ?? this.deactivatedList,
      state: state ?? this.state,
    );
  }
}

class TemplatesBlocStateError extends TemplatesBlocState {}

///
/// BLOC
///

class TemplatesBloc extends Bloc<TemplatesBlocEvent, TemplatesBlocState> {
  final TemplateRepository templateRepository;

  TemplatesBloc({required this.templateRepository})
    : super(TemplatesBlocStateInitial()) {
    on<TemplatesBlocLoadTemplates>((event, emit) async {
      try {
        final all = await templateRepository.getAllTempalates();
        final activates = await templateRepository.getActivatedTempalates();
        final deactivates = await templateRepository.getDeactivatedTempalates();

        emit(
          TemplatesBlocStateLoaded(
            allList: all,
            activatedList: activates,
            deactivatedList: deactivates,
          ),
        );
      } catch (e) {
        emit(TemplatesBlocStateError());
      }
    });

    on<TemplatesBlocChangeViewState>((event, emit) {
      final currentState = state;

      if (currentState is TemplatesBlocStateLoaded) {
        emit(currentState.copyWith(state: event.state));
      }
    });

    on<TemplatesBlocEventDeActivateTemplate>((event, emit) async {
      try {
        await templateRepository.deactivateTemplate(model:  event.template);
      } catch (e) {
        logger.e(e);
        emit(TemplatesBlocStateError());
      } finally {
        add(TemplatesBlocLoadTemplates());
      }
    });

    on<TemplatesBlocEventActivateTemplate>((event, emit) async {
      try {
        await templateRepository.activateTemplate(model:  event.template);
      } catch (e) {
        logger.e(e);
        emit(TemplatesBlocStateError());
      } finally {
        add(TemplatesBlocLoadTemplates());
      }
    }); 

     on<TemplatesBlocEventToogleVisibleTemplate>((event, emit) async {
      try {
        if (event.template.visibility == true) {
          await templateRepository.deactivateTemplate(model: event.template);
        } else {
          await templateRepository.activateTemplate(model: event.template);
        }
      } catch (e) {
        logger.e(e);
        emit(TemplatesBlocStateError());
      } finally {
        add(TemplatesBlocLoadTemplates());
      }
    });  
  }
}
