import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_search/user_info/user_info_controller.dart';
import 'package:github_user_search/user_search/user_model.dart';

class UserInfoPageArgs {
  final UserModel model;

  UserInfoPageArgs({
    required this.model,
  });
}

class UserInfoPage extends StatefulWidget {
  static const route = 'user-info';

  final UserInfoPageArgs args;

  const UserInfoPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late final UserInfoController controller;

  @override
  initState() {
    super.initState();

    controller = GetIt.I.get<UserInfoController>();

    controller.fetchUserInfo(widget.args.model.id).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: controller.model != null
            ? buildUserInfo()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget buildUserInfo() => Column(
        children: [
          const SizedBox(height: 24),
          Hero(
            tag: controller.model!.username,
            child: CircleAvatar(
              maxRadius: 81,
              backgroundImage: NetworkImage(
                controller.model!.avatarUrl,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            controller.model!.username.capitalized,
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildItem('Followers', controller.model!.numberOfFollowers),
              buildItem('Following', controller.model!.numberOfFollowing),
              buildItem('Repos', controller.model!.numberOfRepos),
            ],
          ),
        ],
      );

  Widget buildItem(label, value) => Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
