import 'package:get_it/get_it.dart';
import 'package:twitter/core/providers/tweet_provider.dart';
import 'package:twitter/core/providers/user_provider.dart';
import 'package:twitter/core/services/tweet_service.dart';
import 'package:twitter/core/services/user_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => UserService());

  serviceLocator.registerLazySingleton(() => TweetService());

  serviceLocator.registerLazySingleton(() => UserProvider());

  serviceLocator.registerLazySingleton(() => TweetProvider());
}
