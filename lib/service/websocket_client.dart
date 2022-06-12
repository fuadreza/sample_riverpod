abstract class WebSocket {
  Stream<int> getStreamInt([int start]);
}

class WebSocketClient implements WebSocket {

  @override
  Stream<int> getStreamInt([int start = 0]) async* {
    int i = start;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield i++;
    }
  }
}