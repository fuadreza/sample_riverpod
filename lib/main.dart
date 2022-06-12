import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/screen/home_page.dart';
import 'package:sample_riverpod/service/websocket_client.dart';

final webSocketClientProvider = Provider<WebSocket>((ref) => WebSocketClient());

final counterProvider = StateProvider.autoDispose((ref) => 0);

final counterStreamProvider = StreamProvider.family.autoDispose<int, int>((ref, start) {
  final wsClient = ref.watch(webSocketClientProvider);
  return wsClient.getStreamInt(start);
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
