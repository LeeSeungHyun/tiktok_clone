class ChatRoomModel {
  final String id;
  final String personA;
  final String personB;

  ChatRoomModel({
    required this.id,
    required this.personA,
    required this.personB,
  });

  ChatRoomModel.fromJson(
      {required Map<String, dynamic> json, required String chatRoomId})
      : id = chatRoomId,
        personA = json['personA'],
        personB = json['personB'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "personA": personA,
      "personB": personB,
    };
  }
}
