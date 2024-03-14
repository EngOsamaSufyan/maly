class User {
  final int id;
  final String name;
  final String username;
  final String? email;
  final String password;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.username,
    this.email,
    required this.password,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      password: json['password'] as String,
      image: json['image'] as String,
    );
  }

}