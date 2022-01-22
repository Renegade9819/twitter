import 'package:get_it/get_it.dart';
import 'package:twitter/core/services/tweet_service.dart';
import 'package:twitter/core/services/user_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<UserService>(() => UserService());

  serviceLocator.registerLazySingleton<TweetService>(() => TweetService());
}
