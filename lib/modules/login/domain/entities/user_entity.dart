class UserEntity {
  final String name;
  final String token;

  UserEntity({
    required this.name,
    required this.token,
  });

  UserEntity copyWith({
    String? name,
    String? token,
  }) =>
      UserEntity(
        name: name ?? this.name,
        token: token ?? this.token,
      );
}
