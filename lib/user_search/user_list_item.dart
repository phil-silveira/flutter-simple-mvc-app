import 'package:flutter/material.dart';
import 'package:github_user_search/user_info/user_info_page.dart';
import 'package:github_user_search/user_search/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel model;

  const UserListItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  onItemPressed(BuildContext context) {
    Navigator.of(context).pushNamed(
      UserInfoPage.route,
      arguments: UserInfoPageArgs(
        model: model,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Hero(
          tag: model.username,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              model.avatarUrl,
            ),
          ),
        ),
        title: Text(
          model.username.capitalized,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => onItemPressed(context),
      );
}
