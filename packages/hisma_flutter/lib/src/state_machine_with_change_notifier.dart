import 'package:flutter/foundation.dart';
import 'package:hisma/hisma.dart';

class StateMachineWithChangeNotifier<S, E, T> extends StateMachine<S, E, T>
    with ChangeNotifier {
  StateMachineWithChangeNotifier({
    List<E> events = const [],
    required String name,
    HistoryLevel? history,
    required S initialStateId,
    required StateMap<S, E, T> states,
    required TransitionMap<T, S> transitions,
  }) : super(
          events: events,
          name: name,
          history: history,
          initialStateId: initialStateId,
          states: states,
          transitions: transitions,
        );

  factory StateMachineWithChangeNotifier.fromStateMachine(
    StateMachine<S, E, T> sm,
  ) =>
      StateMachineWithChangeNotifier(
        events: sm.events,
        name: sm.name,
        history: sm.history,
        initialStateId: sm.initialStateId,
        states: sm.states,
        transitions: sm.transitions,
      );

  @override
  Future<void> fire(E eventId, {dynamic data, bool external = true}) async {
    final before = activeStateId;
    await super.fire(eventId, data: data, external: external);
    final after = activeStateId;
    if (before != after) notifyListeners();
  }

  @override
  Future<void> start({
    S? entryPointId,
    dynamic data,
    bool historyFlowDown = false,
  }) async {
    final before = activeStateId;
    await super.start(entryPointId: entryPointId, data: data);
    final after = activeStateId;
    if (before != after) notifyListeners();
  }

  // We shall NOT send notification in case of stop as RouterDelegate would
  // try building Navigator.pages and that is not needed as pages shall remain
  // to allow transition from old to new state.
  //
  @override
  Future<void> stop({required dynamic data}) async {
    final before = activeStateId;
    await super.stop(data: data);
    final after = activeStateId;
    if (before != after) notifyListeners();
  }

  @override
  StateMachineWithChangeNotifier<S1, E1, T1> find<S1, E1, T1>(String name) {
    final machine = super.find<S1, E1, T1>(name);
    if (machine is! StateMachineWithChangeNotifier<S1, E1, T1>) {
      throw Exception('Machine $name is ${machine.runtimeType}.');
    }
    return machine;
  }
}
