import 'package:github_user_search/user_info/user_info_model.dart';
import 'package:github_user_search/user_info/user_info_repository.dart';

class UserInfoController {
  final UserInfoRepository repository;
  UserInfoModel? model;

  UserInfoController({
    required this.repository,
  });

  Future<void> fetchUserInfo(int id) async {
    model = await repository.fetchUserInfoById(id);
  }
}
