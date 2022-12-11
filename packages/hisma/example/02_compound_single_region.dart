// ignore_for_file: avoid_print, file_names

import 'package:hisma/hisma.dart';
// import 'package:hisma_console_monitor/hisma_console_monitor.dart';
import 'package:hisma_visual_monitor/hisma_visual_monitor.dart';

import '01_simple.dart' as lm;

enum S { half, full }

enum E { change }

enum T { toHalf, toFull }

const brightnessMachineName = 'brightnessMachine';

StateMachine<S, E, T> createBrightnessMachine({
  RegionList<S, E, T>? regions,
}) =>
    StateMachine<S, E, T>(
      name: brightnessMachineName,
      events: E.values,
      initialStateId: S.half,
      states: {
        S.half: State(
          etm: {
            E.change: [T.toFull],
          },
          onEntry: Action(
            description: 'Half light.',
            action: (machine, parameter) async => print('HALF'),
          ),
        ),
        S.full: State(
          etm: {
            E.change: [T.toHalf],
          },
          onEntry: Action(
            description: 'Full light.',
            action: (machine, parameter) async => print('FULL'),
          ),
        ),
      },
      transitions: {
        T.toFull: Transition(to: S.full),
        T.toHalf: Transition(to: S.half),
      },
    );

final lightMachine = lm.createLightMachine(
  regions: [Region(machine: createBrightnessMachine())],
);

Future<void> play() async {
  while (true) {
    await Future<void>.delayed(const Duration(seconds: 1));
    await lightMachine.fire(lm.E.turnOn);

    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(const Duration(seconds: 1));
      await lightMachine.find<S, E, T>(brightnessMachineName).fire(E.change);
      await Future<void>.delayed(const Duration(seconds: 1));
      await lightMachine.find<S, E, T>(brightnessMachineName).fire(E.change);
    }

    await Future<void>.delayed(const Duration(seconds: 1));
    await lightMachine.fire(lm.E.turnOff);
  }
}

Future<void> main() async {
  StateMachine.monitorCreators = [
    (machine) => VisualMonitor(machine),
  ];

  await lightMachine.start();
  play();
}
