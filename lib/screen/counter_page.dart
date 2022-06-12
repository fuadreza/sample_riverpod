import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/main.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (context) => const CounterPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    listenChange(context, ref);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counterProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void listenChange(BuildContext context, WidgetRef ref) {
    ref.listen<int>(
      counterProvider,
      (previous, next) {
        if (next % 5 == 0 && next != 0) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Horray!'),
                content: Text('Already hit $next. Try go another milestone!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  )
                ],
              );
            },
          );
        }
      },
    );
  }
}
