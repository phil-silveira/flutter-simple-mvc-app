import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_search/user_search/user_search_controller.dart';

import 'package:github_user_search/user_search/user_list_item.dart';

class UserSearchPage extends StatefulWidget {
  static const route = 'user-search';

  const UserSearchPage({Key? key}) : super(key: key);

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  late final UserSearchController controller;

  onSearchPressed() async {
    await controller.searchUsersByText();
    setState(() {});
  }

  onSearchTextChanged(String text) {
    setState(() {
      controller.searchText = text;
    });
  }

  @override
  initState() {
    super.initState();

    controller = GetIt.I.get<UserSearchController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              TextFormField(
                onChanged: onSearchTextChanged,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onSearchPressed,
                    icon: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Search for a Github user',
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.resultedUsers.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, int index) => UserListItem(
                    model: controller.resultedUsers[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
