import 'package:get_it/get_it.dart';
import 'package:twitter/providers/tweet_provider.dart';
import 'package:twitter/services/tweet_service.dart';
import 'package:twitter/services/tweet_service_api.dart';
import 'package:twitter/services/tweet_service_impl.dart';
import 'package:twitter/services/tweet_service_web.dart';
import 'package:twitter/services/user_service.dart';
import 'package:twitter/services/user_service_api.dart';
import 'package:twitter/services/user_service_impl.dart';
import 'package:twitter/services/user_service_web.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
      .registerLazySingleton<UserService>(() => UserServiceFakeImpl());

  serviceLocator
      .registerLazySingleton<TweetService>(() => TweetServiceFakeImpl());

  serviceLocator.registerLazySingleton<UserServiceAPI>(() => UserServiceWeb());

  serviceLocator
      .registerLazySingleton<TweetServiceAPI>(() => TweetServiceWeb());
}
