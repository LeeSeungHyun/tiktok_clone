class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String birth;
  final String bio;
  final String link;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.birth,
    required this.bio,
    required this.link,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        birth = "",
        bio = "",
        link = "";

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"],
        birth = json["birth"],
        bio = json["bio"],
        link = json["link"];

  Map<String, String> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "birth": birth,
      "bio": bio,
      "link": link,
    };
  }
}
