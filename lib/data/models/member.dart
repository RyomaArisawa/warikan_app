import 'package:warikan_app/data/models/payment_info.dart';

class Member {
  //メンバー名
  String name;
  //メンバー毎の合計金額
  int costPerMember;
  //支払い情報リスト
  List<PaymentInfo> paymentInfoList;

//<editor-fold desc="Data Methods">
  factory Member.init() {
    return Member(
      name: "",
      costPerMember: 0,
      paymentInfoList: [
        PaymentInfo.init(),
      ],
    );
  }

  Member({
    required this.name,
    required this.costPerMember,
    required this.paymentInfoList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          costPerMember == other.costPerMember &&
          paymentInfoList == other.paymentInfoList);

  @override
  int get hashCode =>
      name.hashCode ^ costPerMember.hashCode ^ paymentInfoList.hashCode;

  @override
  String toString() {
    return 'Member{' +
        ' name: $name,' +
        ' costPerMember: $costPerMember,' +
        ' paymentInfoList: $paymentInfoList,' +
        '}';
  }

  Member copyWith({
    String? name,
    int? costPerMember,
    List<PaymentInfo>? paymentInfoList,
  }) {
    return Member(
      name: name ?? this.name,
      costPerMember: costPerMember ?? this.costPerMember,
      paymentInfoList: paymentInfoList ?? this.paymentInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'costPerMember': this.costPerMember,
      'paymentInfoList': this.paymentInfoList,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name'] as String,
      costPerMember: map['costPerMember'] as int,
      paymentInfoList: map['paymentInfoList'] as List<PaymentInfo>,
    );
  }

//</editor-fold>
}
