import 'package:uuid/uuid.dart';
import 'package:split/data/mixins/visible.dart';

class Memo with Visible {
  //メモID
  final String id;
  //ユーザーID
  final String uid;
  //メモタイトル
  final String title;
  //メモ内容
  final String content;
  //作成日時
  final DateTime createdAt;

//<editor-fold desc="Data Methods">
  factory Memo.init() {
    return Memo(
      id: Uuid().v4(),
      uid: "",
      title: "title",
      content: "content",
      createdAt: DateTime.now(),
    );
  }

  Memo({
    required this.id,
    required this.uid,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          uid == other.uid &&
          title == other.title &&
          content == other.content &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      id.hashCode ^
      uid.hashCode ^
      title.hashCode ^
      content.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'Memo{' +
        ' id: $id,' +
        ' uid: $uid,' +
        ' title: $title,' +
        ' content: $content,' +
        ' createdAt: $createdAt,' +
        '}';
  }

  Memo copyWith({
    String? id,
    String? uid,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return Memo(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'title': this.title,
      'content': this.content,
      'createdAt': this.createdAt.toIso8601String(),
    };
  }

  factory Memo.fromMap(Map<String, dynamic> map) {
    return Memo(
      id: map['id'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

//</editor-fold>
}
