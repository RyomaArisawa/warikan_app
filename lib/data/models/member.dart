import 'package:uuid/uuid.dart';
import 'package:warikan_app/data/models/payment.dart';

class Member {
  //メンバーID
  final String memberId;
  //メンバー名
  final String name;
  //支払い情報リスト
  List<Payment> paymentList;

//<editor-fold desc="Data Methods">
  factory Member.init() {
    return Member(
      memberId: Uuid().v4(),
      name: "",
      paymentList: [
        Payment.init(),
      ],
    );
  }

  Member({
    required this.memberId,
    required this.name,
    required this.paymentList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          runtimeType == other.runtimeType &&
          memberId == other.memberId &&
          name == other.name &&
          paymentList == other.paymentList);

  @override
  int get hashCode => memberId.hashCode ^ name.hashCode ^ paymentList.hashCode;

  @override
  String toString() {
    return 'Member{' +
        ' memberId: $memberId,' +
        ' name: $name,' +
        ' paymentList: $paymentList,' +
        '}';
  }

  Member copyWith({
    String? memberId,
    String? name,
    List<Payment>? paymentList,
  }) {
    return Member(
      memberId: memberId ?? this.memberId,
      name: name ?? this.name,
      paymentList: paymentList ?? this.paymentList,
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
      paymentList: map['paymentList'] as List<Payment>,
    );
  }

//</editor-fold>
}
