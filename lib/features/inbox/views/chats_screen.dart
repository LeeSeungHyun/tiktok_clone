import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/inbox/view_models/chat_rooms_view_model.dart';
import 'package:tiktok_clone/features/inbox/views/chat_detail_screen.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static const String routeName = "chats";
  static const String routeURL = "/chats";
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  late int length;
  late List<UserProfileModel> _list = [];

  void _onChatTap(String chatRoomId) {
    context.pushNamed(
      ChatDetailScreen.routeName,
      pathParameters: {"chatRoomId": chatRoomId},
    );
  }

  void _onCreateChatRoom(UserProfileModel user) {
    print(user.uid);
  }

  void getUserProfiles() async {
    final profile = ref.read(authRepo).user;
    _list = await ref.read(usersProvider.notifier).getUserProfiles();
    // 자기 자신 제외
    _list = _list.where((user) {
      return user.uid != profile!.uid;
    }).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserProfiles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct messages'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 320, // 모달 높이 크기
                    decoration: const BoxDecoration(
                      color: Colors.white, // 모달 배경색
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0), // 모달 좌상단 라운딩 처리
                        topRight: Radius.circular(0), // 모달 우상단 라운딩 처리
                      ),
                    ),
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Sizes.size8,
                        ),
                        child: Text(
                          '사용자 목록',
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            for (var user in _list)
                              ListTile(
                                onTap: () => _onCreateChatRoom(user),
                                leading: CircleAvatar(
                                    radius: 30,
                                    foregroundImage: NetworkImage(
                                      "https://firebasestorage.googleapis.com/v0/b/tictok-iop.appspot.com/o/avatars%2F${user.uid}?alt=media&haha=${DateTime.now().toString()}",
                                    )),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      user.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(user.bio),
                              ),
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              );
            },
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Gaps.v14,
          ref.watch(chatRoomsProvider).when(
                data: (data) => SizedBox(
                  height: size.height,
                  child: ListView(
                    children: [
                      for (var item in data)
                        ListTile(
                          onTap: () => _onChatTap(item.id),
                          leading: const CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/14923625?v=4",
                            ),
                            child: Text('승현'),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '현진',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "2:16 PM",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size12,
                                ),
                              ),
                            ],
                          ),
                          subtitle: const Text("Don't forget to make video"),
                        ),
                    ],
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              )
        ],
      ),
    );
  }
}
