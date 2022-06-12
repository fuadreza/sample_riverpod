import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/main.dart';

class CounterStreamPage extends ConsumerWidget {
  const CounterStreamPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (context) => const CounterStreamPage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> counter = ref.watch(counterStreamProvider(1));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counterStreamProvider(1));
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter
                  .when(
                    data: (int value) => value,
                    error: (Object e, _) => e,
                    loading: () => 0,
                  )
                  .toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
