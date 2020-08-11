import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './chatroom.dart';
import './publics.dart';

final List<SingleChildWidget> providerList = [
  ChangeNotifierProvider<MustStore>(create: (context) => MustStore()),
  ChangeNotifierProvider<HotStore>(create: (context) => HotStore()),
  ChangeNotifierProvider<PublicsStore>(create: (context) => PublicsStore()),
];
