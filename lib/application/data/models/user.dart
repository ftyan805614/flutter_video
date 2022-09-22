class UserModel {
  int id;
  String name;

  UserModel(this.id, this.name);

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    var id = jsonMap["id"] as int;
    var name = jsonMap["name"] as String;
    final model = UserModel(id, name);
    return model;
  }
}
