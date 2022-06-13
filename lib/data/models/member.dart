import 'package:warikan_app/data/models/payment.dart';

class Member {
  //メンバー名
  String name;
  //メンバー毎の合計金額
  int costPerMember;
  //支払い情報リスト
  List<Payment> paymentList;

//<editor-fold desc="Data Methods">

  factory Member.init() {
    return Member(
      name: "",
      costPerMember: 0,
      paymentList: [
        Payment.init(),
      ],
    );
  }

  Member({
    required this.name,
    required this.costPerMember,
    required this.paymentList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          costPerMember == other.costPerMember &&
          paymentList == other.paymentList);

  @override
  int get hashCode =>
      name.hashCode ^ costPerMember.hashCode ^ paymentList.hashCode;

  @override
  String toString() {
    return 'Member{' +
        ' name: $name,' +
        ' costPerMember: $costPerMember,' +
        ' paymentList: $paymentList,' +
        '}';
  }

  Member copyWith({
    String? name,
    int? costPerMember,
    List<Payment>? paymentList,
  }) {
    return Member(
      name: name ?? this.name,
      costPerMember: costPerMember ?? this.costPerMember,
      paymentList: paymentList ?? this.paymentList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'costPerMember': this.costPerMember,
      'paymentList': this.paymentList,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name'] as String,
      costPerMember: map['costPerMember'] as int,
      paymentList: map['paymentList'] as List<Payment>,
    );
  }

//</editor-fold>
}
