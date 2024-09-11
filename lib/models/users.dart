class Users {
  final String email;
  final String name;
  final String username;
  final String avatar;
  final int role;

  Users({
    required this.email,
    required this.name,
    required this.username,
    this.avatar = "",
    this.role = 1,
  });

  Map<String, dynamic> toMap() =>
      {'email': email, 'name': name, 'username': username, 'avatar': avatar};

  factory Users.fromJson(Map<String, dynamic> map) {
    return Users(
        email: map['email'],
        name: map['name'],
        username: map['username'],
        avatar: map['avatar'],
        role: map['role'] ?? 1);
  }

  @override
  String toString() {
    return 'Users{email: $email, name: $name, username: $username,avatar: $avatar,role: $role}';
  }
}
