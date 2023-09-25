import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/inbox/models/chat_room.dart';
import 'package:tiktok_clone/features/inbox/repos/chat_rooms_repo.dart';

class ChatRoomsViewModel extends AsyncNotifier<List<ChatRoomModel>> {
  late final ChatRoomsRepo _repo;

  List<ChatRoomModel> _list = [];

  Future<List<ChatRoomModel>> _fetchChatRooms() async {
    final result = await _repo.fetchChatRooms();
    final rooms = result.docs.map(
      (doc) => ChatRoomModel.fromJson(
        json: doc.data(),
        chatRoomId: doc.id,
      ),
    );
    return rooms.toList();
  }

  @override
  FutureOr<List<ChatRoomModel>> build() async {
    _repo = ref.read(chatRoomsRepo);
    _list = await _fetchChatRooms();
    return _list;
  }
}

final chatRoomsProvider =
    AsyncNotifierProvider<ChatRoomsViewModel, List<ChatRoomModel>>(
  () => ChatRoomsViewModel(),
);
