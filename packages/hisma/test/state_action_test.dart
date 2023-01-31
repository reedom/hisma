import 'package:hisma/hisma.dart';
import 'package:test/test.dart';

enum S { a, b }

enum E { inc, dec }

enum T { toA, toB }

StateMachine<S, E, T> createMachine([dynamic data]) => StateMachine<S, E, T>(
      name: 'm1',
      data: data,
      initialStateId: S.a,
      states: {
        S.a: State(
          etm: {
            E.inc: [T.toB],
          },
          onEntry: Action(
            description: 'double',
            action: (machine, arg) async {},
          ),
        ),
        S.b: State(
          etm: {
            E.dec: [T.toA],
          },
        ),
      },
      transitions: {
        T.toA: Transition(
          to: S.a,
          onAction: Action(
            description: 'decrease',
            action: (machine, arg) async {
              machine.data = (machine.data as int) - 1;
            },
          ),
        ),
        T.toB: Transition(
          to: S.b,
          onAction: Action(
            description: 'increase',
            action: (machine, arg) async {
              machine.data = (machine.data as int) + 1;
            },
          ),
        ),
      },
    );

void main() {
  group('Data initialization tests', () {
    test('data initialization 1', () async {
      final m1 = createMachine();
      expect(m1.data, equals(null));
      await m1.start();
      expect(m1.data, equals(null));
    });

    test('data initialization 2', () async {
      final m1 = createMachine(0);
      expect(m1.data, equals(0));
      await m1.start();
      expect(m1.data, equals(0));
    });
    test(
      'data initialization 3',
      () async {
        final m1 = createMachine();
        expect(m1.data, equals(null));
        await m1.start(arg: 0);
        expect(m1.data, equals(0));
      },
      skip: true,
    );
    test(
      'data initialization 4',
      () async {
        final m1 = createMachine(0);
        expect(m1.data, equals(0));
        await m1.start(arg: 1);
        expect(m1.data, equals(1));
      },
      skip: true,
    );
  });

  group('Action tests', () {
    test(
      'Action test 1',
      () async {
        final m1 = createMachine(0);
        expect(m1.data, equals(0));
        await m1.start();
        expect(m1.data, equals(0));

        for (var i = 0; i < 100; i++) {
          await m1.fire(E.inc);
          expect(m1.data, equals(1));

          await m1.fire(E.dec);
          expect(m1.data, equals(0));
        }
      },
    );
  });
}