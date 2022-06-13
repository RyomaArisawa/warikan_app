import 'package:uuid/uuid.dart';

import 'member.dart';

class Split {
  //割り勘情報ID
  String id;
  //ユーザID;
  String uid;
  //メンバーリスト
  List<Member> members;
  //作成日時
  DateTime cratedAt;
  //支払い合計金額
  int totalCost;

//<editor-fold desc="Data Methods">
  factory Split.init() {
    return Split(
      id: Uuid().v4(),
      uid: "",
      members: [
        Member.init(),
      ],
      cratedAt: DateTime.now(),
      totalCost: 0,
    );
  }

  Split({
    required this.id,
    required this.uid,
    required this.members,
    required this.cratedAt,
    required this.totalCost,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Split &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          uid == other.uid &&
          members == other.members &&
          cratedAt == other.cratedAt &&
          totalCost == other.totalCost);

  @override
  int get hashCode =>
      id.hashCode ^
      uid.hashCode ^
      members.hashCode ^
      cratedAt.hashCode ^
      totalCost.hashCode;

  @override
  String toString() {
    return 'Split{' +
        ' id: $id,' +
        ' uid: $uid,' +
        ' members: $members,' +
        ' cratedAt: $cratedAt,' +
        ' totalCost: $totalCost,' +
        '}';
  }

  Split copyWith({
    String? id,
    String? uid,
    List<Member>? members,
    DateTime? cratedAt,
    int? totalCost,
  }) {
    return Split(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      members: members ?? this.members,
      cratedAt: cratedAt ?? this.cratedAt,
      totalCost: totalCost ?? this.totalCost,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'members': this.members,
      'cratedAt': this.cratedAt,
      'totalCost': this.totalCost,
    };
  }

  factory Split.fromMap(Map<String, dynamic> map) {
    return Split(
      id: map['id'] as String,
      uid: map['uid'] as String,
      members: map['members'] as List<Member>,
      cratedAt: map['cratedAt'] as DateTime,
      totalCost: map['totalCost'] as int,
    );
  }

//</editor-fold>
}
