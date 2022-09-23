class UserModel {
  String? uid;
  String? name;
  String? email;
  DateTime? timestamp;

  UserModel({this.uid, this.name, this.email, this.timestamp});

  Map<String, dynamic> toMap(UserModel user) {
    var data = <String, dynamic>{};

    data["uid"] = user.uid;
    data["username"] = user.name;
    data["email"] = user.email;
    data["timestamp"] = user.timestamp;

    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData["uid"];
    name = mapData["username"];
    email = mapData["email"];
  }
}
