import 'package:uuid/uuid.dart';

import 'member.dart';

class Split {
  //割り勘情報ID
  final String id;
  //ユーザID;
  final String uid;
  //タイトル
  String title;
  //メンバーリスト
  List<Member> members;
  //作成日時
  DateTime cratedAt;
  //支払い合計金額
  int totalCost;
  //精算済みフラグ
  bool isSettled;

//<editor-fold desc="Data Methods">
  factory Split.init() {
    return Split(
      id: Uuid().v4(),
      uid: "",
      title: "",
      members: [
        Member.init(),
      ],
      cratedAt: DateTime.now(),
      totalCost: 0,
      isSettled: false,
    );
  }

  Split({
    required this.id,
    required this.uid,
    required this.title,
    required this.members,
    required this.cratedAt,
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
          cratedAt == other.cratedAt &&
          totalCost == other.totalCost &&
          isSettled == other.isSettled);

  @override
  int get hashCode =>
      id.hashCode ^
      uid.hashCode ^
      title.hashCode ^
      members.hashCode ^
      cratedAt.hashCode ^
      totalCost.hashCode ^
      isSettled.hashCode;

  @override
  String toString() {
    return 'Split{' +
        ' id: $id,' +
        ' uid: $uid,' +
        ' title: $title,' +
        ' members: $members,' +
        ' cratedAt: $cratedAt,' +
        ' totalCost: $totalCost,' +
        ' isSettled: $isSettled,' +
        '}';
  }

  Split copyWith({
    String? id,
    String? uid,
    String? title,
    List<Member>? members,
    DateTime? cratedAt,
    int? totalCost,
    bool? isSettled,
  }) {
    return Split(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      members: members ?? this.members,
      cratedAt: cratedAt ?? this.cratedAt,
      totalCost: totalCost ?? this.totalCost,
      isSettled: isSettled ?? this.isSettled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'title': this.title,
      'cratedAt': this.cratedAt,
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
      cratedAt: map['cratedAt'] as DateTime,
      totalCost: map['totalCost'] as int,
      isSettled: map['isSettled'] as bool,
    );
  }

//</editor-fold>
}
