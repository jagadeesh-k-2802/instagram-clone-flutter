import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamChatSingleton {
  static StreamChatSingleton? instance;
  StreamChatClient client;
  StreamChatSingleton._internal({required this.client});

  factory StreamChatSingleton({required StreamChatClient client}) {
    instance ??= StreamChatSingleton._internal(client: client);
    return instance!;
  }
}
