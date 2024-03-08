

class User {
  final List<Users> users;

  User({
    required this.users,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<Users>.from(json["users"].map((x) => Users.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class Users {
  final int id;
  final String name;
  final String username;
  final String password;
  final String image;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.image,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "image": image,
      };
}
