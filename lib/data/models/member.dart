import 'package:uuid/uuid.dart';
import 'package:split/data/models/payment.dart';

class Member {
  //メンバーID
  final String memberId;
  //メンバー名
  final String name;
  //支払い情報リスト
  List<Payment> payments;

//<editor-fold desc="Data Methods">
  factory Member.init() {
    return Member(
      memberId: Uuid().v4(),
      name: "",
      payments: [
        Payment.init(),
      ],
    );
  }

  Member({
    required this.memberId,
    required this.name,
    required this.payments,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          runtimeType == other.runtimeType &&
          memberId == other.memberId &&
          name == other.name &&
          payments == other.payments);

  @override
  int get hashCode => memberId.hashCode ^ name.hashCode ^ payments.hashCode;

  @override
  String toString() {
    return 'Member{' +
        ' memberId: $memberId,' +
        ' name: $name,' +
        ' payments: $payments,' +
        '}';
  }

  Member copyWith({
    String? memberId,
    String? name,
    List<Payment>? payments,
  }) {
    return Member(
      memberId: memberId ?? this.memberId,
      name: name ?? this.name,
      payments: payments ?? this.payments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'memberId': this.memberId,
      'name': this.name,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      memberId: map['memberId'] as String,
      name: map['name'] as String,
      payments: map['payments'] as List<Payment>,
    );
  }

//</editor-fold>
}
