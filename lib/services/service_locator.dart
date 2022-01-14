import 'package:get_it/get_it.dart';
import 'package:twitter/services/tweet_service.dart';
import 'package:twitter/services/tweet_service_impl.dart';
import 'package:twitter/services/user_service.dart';
import 'package:twitter/services/user_service_impl.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
      .registerLazySingleton<UserService>(() => UserServiceFakeImpl());

  serviceLocator
      .registerLazySingleton<TweetService>(() => TweetServiceFakeImpl());
}
