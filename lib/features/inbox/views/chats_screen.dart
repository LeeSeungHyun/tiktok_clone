import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/models/chat_room.dart';
import 'package:tiktok_clone/features/inbox/view_models/chat_rooms_view_model.dart';
import 'package:tiktok_clone/features/inbox/views/chat_detail_screen.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static const String routeName = "chats";
  static const String routeURL = "/chats";
  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  // final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final List<String> _notifications = List.generate(20, (index) => "${index}h");
  late int length;

  // final List<int> _items = [];

  // final Duration _duration = const Duration(milliseconds: 300);
  late List<ChatRoomModel> _list;

  // void _addItem() {
  //   if (_key.currentState != null) {
  //     _key.currentState!.insertItem(
  //       _items.length,
  //       duration: const Duration(milliseconds: 500),
  //     );
  //     _items.add(_items.length);
  //   }
  // }

  // void _deleteItem(int index) {
  //   if (_key.currentState != null) {
  //     _key.currentState!.removeItem(
  //       index,
  //       (context, animation) => SizeTransition(
  //         sizeFactor: animation,
  //         child: Container(
  //           color: Colors.red,
  //           child: _makeTile(index),
  //         ),
  //       ),
  //       duration: _duration,
  //     );
  //     _items.removeAt(index);
  //   }
  // }

  void _onChatTap(String chatRoomId) {
    context.pushNamed(
      ChatDetailScreen.routeName,
      pathParameters: {"chatRoomId": chatRoomId},
    );
  }

  // Widget _makeTile(int index) {
  //   return ListTile(
  //     // onLongPress: () => _deleteItem(index),
  //     onLongPress: () => {},
  //     onTap: () => _onChatTap(index),
  //     leading: const CircleAvatar(
  //       radius: 30,
  //       foregroundImage: NetworkImage(
  //         "https://avatars.githubusercontent.com/u/14923625?v=4",
  //       ),
  //       child: Text('승현'),
  //     ),
  //     title: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         Text(
  //           '현진 $index',
  //           style: const TextStyle(
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         Text(
  //           "2:16 PM",
  //           style: TextStyle(
  //             color: Colors.grey.shade500,
  //             fontSize: Sizes.size12,
  //           ),
  //         ),
  //       ],
  //     ),
  //     subtitle: const Text("Don't forget to make video"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // _list = ref.watch(chatRoomsProvider.notifier);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Direct messages'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      // body: AnimatedList(
      //   key: _key,
      //   padding: const EdgeInsets.symmetric(
      //     vertical: Sizes.size10,
      //   ),
      //   itemBuilder: (context, index, animation) {
      //     return FadeTransition(
      //       key: UniqueKey(),
      //       opacity: animation,
      //       child: SizeTransition(
      //         sizeFactor: animation,
      //         // child: _makeTile(index),
      //         child: ref.watch(chatRoomsProvider).when(
      //               error: (error, stackTrace) => Center(
      //                 child: Text(
      //                   error.toString(),
      //                 ),
      //               ),
      //               loading: () => const Center(
      //                 child: CircularProgressIndicator.adaptive(),
      //               ),
      //               data: (data) {
      //                 print(index);
      //                 return _makeTile(index);
      //               },
      //             ),
      //       ),
      //     );
      //   },
      // ),
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
                // for (var item in data) {
                //     ListTile(
                //   leading: const CircleAvatar(
                //     radius: 30,
                //     foregroundImage: NetworkImage(
                //       "https://avatars.githubusercontent.com/u/14923625?v=4",
                //     ),
                //     child: Text('승현'),
                //   ),
                //   title: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       const Text(
                //         '현진',
                //         style: TextStyle(
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       Text(
                //         "2:16 PM",
                //         style: TextStyle(
                //           color: Colors.grey.shade500,
                //           fontSize: Sizes.size12,
                //         ),
                //       ),
                //     ],
                //   ),
                //   subtitle: const Text("Don't forget to make video"),
                // ),
                // }
                // },
                error: (error, stackTrace) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          //   children: [
          //     for (var item in data) {
          //   ListTile(
          //     leading: const CircleAvatar(
          //       radius: 30,
          //       foregroundImage: NetworkImage(
          //         "https://avatars.githubusercontent.com/u/14923625?v=4",
          //       ),
          //       child: Text('승현'),
          //     ),
          //     title: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         const Text(
          //           '현진',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //           ),
          //         ),
          //         Text(
          //           "2:16 PM",
          //           style: TextStyle(
          //             color: Colors.grey.shade500,
          //             fontSize: Sizes.size12,
          //           ),
          //         ),
          //       ],
          //     ),
          //     subtitle: const Text("Don't forget to make video"),
          //   );
          // },
        ],
      ),
    );
  }
}
