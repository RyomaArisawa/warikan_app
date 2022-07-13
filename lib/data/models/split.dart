import 'package:uuid/uuid.dart';
import 'package:split/data/mixins/visible.dart';

import 'member.dart';

class Split with Visible {
  //割り勘情報ID
  final String id;
  //ユーザID;
  final String uid;
  //タイトル
  final String title;
  //メンバーリスト
  final List<Member> members;
  //作成日時
  final DateTime createdAt;
  //支払い合計金額
  final int totalCost;
  //精算済みフラグ
  final bool isSettled;

//<editor-fold desc="Data Methods">
  factory Split.init() {
    return Split(
      id: Uuid().v4(),
      uid: "",
      title: "",
      members: [
        Member.init(),
      ],
      createdAt: DateTime.now(),
      totalCost: 0,
      isSettled: false,
    );
  }

  Split({
    required this.id,
    required this.uid,
    required this.title,
    required this.members,
    required this.createdAt,
    required this.totalCost,
    required this.isSettled,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Split &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          uid == other.uid &&
          title == other.title &&
          members == other.members &&
          createdAt == other.createdAt &&
          totalCost == other.totalCost &&
          isSettled == other.isSettled);

  @override
  int get hashCode =>
      id.hashCode ^
      uid.hashCode ^
      title.hashCode ^
      members.hashCode ^
      createdAt.hashCode ^
      totalCost.hashCode ^
      isSettled.hashCode;

  @override
  String toString() {
    return 'Split{' +
        ' id: $id,' +
        ' uid: $uid,' +
        ' title: $title,' +
        ' members: $members,' +
        ' createdAt: $createdAt,' +
        ' totalCost: $totalCost,' +
        ' isSettled: $isSettled,' +
        '}';
  }

  Split copyWith({
    String? id,
    String? uid,
    String? title,
    List<Member>? members,
    DateTime? createdAt,
    int? totalCost,
    bool? isSettled,
  }) {
    return Split(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      members: members ?? this.members,
      createdAt: createdAt ?? this.createdAt,
      totalCost: totalCost ?? this.totalCost,
      isSettled: isSettled ?? this.isSettled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'title': this.title,
      'createdAt': this.createdAt.toIso8601String(),
      'totalCost': this.totalCost,
      'isSettled': this.isSettled,
    };
  }

  factory Split.fromMap(Map<String, dynamic> map) {
    return Split(
      id: map['id'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      members: map['members'] as List<Member>,
      createdAt: DateTime.parse(map['createdAt'] as String),
      totalCost: map['totalCost'] as int,
      isSettled: map['isSettled'] as bool,
    );
  }

//</editor-fold>
}
