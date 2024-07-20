import 'package:dalel/core/app/dalel_app.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/check_state_changes.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  checkUserState();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Dalel());
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
  }
}
