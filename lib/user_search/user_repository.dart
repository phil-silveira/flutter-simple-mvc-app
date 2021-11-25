import 'package:dio/dio.dart';
import 'package:github_user_search/user_search/user_model.dart';
import 'dart:developer' as dev;

class UserSearchRepository {
  final Dio provider;

  UserSearchRepository(this.provider);

  Future<List<UserModel>> searchByText(String text) async {
    try {
      final response =
          await provider.get('https://api.github.com/search/users?q=$text');
      dev.log(
        response.data['items'][0].toString(),
        name: runtimeType.toString(),
      );

      final users = (response.data['items'] as List)
          .map(
            (user) => UserModel.fromJson(user),
          )
          .toList();

      return users;
    } catch (e) {
      dev.log(
        'Error on searchByText',
        name: runtimeType.toString(),
        error: e,
      );

      throw Exception('Error on searchByText');
    }
  }
}
