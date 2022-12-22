// Mocks generated by Mockito 5.3.2 from annotations
// in todo/todo_over_view/bloc/todo_over_view_bloc.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:flutter_bloc/flutter_bloc.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo/filter/model/filter.dart' as _i5;
import 'package:todo/todo_over_view/bloc/todo_over_view_bloc.dart' as _i4;
import 'package:todo/todo_over_view/bloc/todo_over_view_event.dart' as _i7;
import 'package:todo/todo_over_view/bloc/todo_over_view_state.dart' as _i3;
import 'package:todo/todo_over_view/repository/repository.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeITodoRepository_0 extends _i1.SmartFake
    implements _i2.ITodoRepository {
  _FakeITodoRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTodoOverviewState_1 extends _i1.SmartFake
    implements _i3.TodoOverviewState {
  _FakeTodoOverviewState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoOverViewBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoOverViewBloc extends _i1.Mock implements _i4.TodoOverViewBloc {
  @override
  _i2.ITodoRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeITodoRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeITodoRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.ITodoRepository);
  @override
  _i5.Filter get filter => (super.noSuchMethod(
        Invocation.getter(#filter),
        returnValue: _i5.Filter.all,
        returnValueForMissingStub: _i5.Filter.all,
      ) as _i5.Filter);
  @override
  set filter(_i5.Filter? _filter) => super.noSuchMethod(
        Invocation.setter(
          #filter,
          _filter,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.TodoOverviewState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTodoOverviewState_1(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeTodoOverviewState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.TodoOverviewState);
  @override
  _i6.Stream<_i3.TodoOverviewState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i3.TodoOverviewState>.empty(),
        returnValueForMissingStub: _i6.Stream<_i3.TodoOverviewState>.empty(),
      ) as _i6.Stream<_i3.TodoOverviewState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i7.TodoOverViewEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i7.TodoOverViewEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.TodoOverviewState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i7.TodoOverViewEvent>(
    _i8.EventHandler<E, _i3.TodoOverviewState>? handler, {
    _i8.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i8.Transition<_i7.TodoOverViewEvent, _i3.TodoOverviewState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i8.Change<_i3.TodoOverviewState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}