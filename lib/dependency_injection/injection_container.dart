import 'package:get_it/get_it.dart';

import '/features/authentecation/injection_container.dart' as auth;
import '/features/home/injection_container.dart' as home;

final get = GetIt.instance;

void init() {
auth.init();
home.init();
}
