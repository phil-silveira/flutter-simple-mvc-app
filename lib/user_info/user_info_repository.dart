import 'package:dio/dio.dart';
import 'dart:developer' as dev;

import 'package:github_user_search/user_info/user_info_model.dart';

class UserInfoRepository {
  final Dio provider;

  UserInfoRepository(this.provider);

  Future<UserInfoModel> fetchUserInfoById(int id) async {
    try {
      final response = await provider.get('https://api.github.com/user/$id');
      dev.log(response.data.toString());

      final info = UserInfoModel.fromJson(response.data);

      return info;
    } catch (e) {
      dev.log(e.toString(), error: e);

      throw Exception('Erro on fetchUserInfoById');
    }
  }
}
