import 'package:provider/provider.dart';

import './chatroom.dart';
import './test.dart';
import './publics.dart';

final List<SingleChildCloneableWidget> providerList = [
  ChangeNotifierProvider<ChatRoomStore>(create: (context) => ChatRoomStore()),
  ChangeNotifierProvider<PublicsStore>(create: (context) => PublicsStore()),
  // ChangeNotifierProvider<WebviewStore>(create: (context) => WebviewStore()),
  ChangeNotifierProvider<Counter>(create: (context) => Counter()),
  ChangeNotifierProvider<Counter1>(create: (context) => Counter1())
];
