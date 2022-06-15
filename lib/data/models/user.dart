class User {
  final String id;
  final String name;
  final String email;
  final String pass;
  final String photoUrl;

//<editor-fold desc="Data Methods">

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.pass,
    required this.photoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          pass == other.pass &&
          photoUrl == other.photoUrl);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      pass.hashCode ^
      photoUrl.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' id: $id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' pass: $pass,' +
        ' photoUrl: $photoUrl,' +
        '}';
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? pass,
    String? photoUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      pass: pass ?? this.pass,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'pass': this.pass,
      'photoUrl': this.photoUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      pass: map['pass'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

//</editor-fold>
}
