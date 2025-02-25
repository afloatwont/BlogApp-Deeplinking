class User {
  final String username;
  final String email;
  final String profilePicture;

  User({
    required this.username,
    required this.email,
    required this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'profilePicture': profilePicture,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
    );
  }
}