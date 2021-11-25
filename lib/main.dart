import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_search/user_info/user_info_controller.dart';
import 'package:github_user_search/user_info/user_info_page.dart';
import 'package:github_user_search/user_info/user_info_repository.dart';
import 'package:github_user_search/user_search/user_repository.dart';
import 'package:github_user_search/user_search/user_search_controller.dart';
import 'package:github_user_search/user_search/user_search_page.dart';

void main() {
  registerRepositories();
  registerControllers();

  runApp(const MyApp());
}

registerRepositories() {
  final provider = Dio();

  GetIt.I.registerSingleton<UserSearchRepository>(
    UserSearchRepository(provider),
  );
  GetIt.instance.registerLazySingleton<UserInfoRepository>(
    () => UserInfoRepository(provider),
  );
}

registerControllers() {
  GetIt.I.registerFactory<UserSearchController>(
    () => UserSearchController(repository: GetIt.I()),
  );
  GetIt.instance.registerFactory<UserInfoController>(
    () => UserInfoController(repository: GetIt.instance()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: UserSearchPage.route,
      routes: {
        UserSearchPage.route: (_) => const UserSearchPage(),
        UserInfoPage.route: (context) => UserInfoPage(
              args: ModalRoute.of(context)?.settings.arguments
                  as UserInfoPageArgs,
            ),
      },
    );
  }
}
