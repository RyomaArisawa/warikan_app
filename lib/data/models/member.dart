import 'package:warikan_app/data/models/payment_info.dart';

class Member {
  String name;
  List<PaymentInfo> paymentInfoList;

//<editor-fold desc="Data Methods">

  Member({
    required this.name,
    required this.paymentInfoList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          paymentInfoList == other.paymentInfoList);

  @override
  int get hashCode => name.hashCode ^ paymentInfoList.hashCode;

  @override
  String toString() {
    return 'Member{' +
        ' name: $name,' +
        ' paymentInfoList: $paymentInfoList,' +
        '}';
  }

  Member copyWith({
    String? name,
    List<PaymentInfo>? paymentInfoList,
  }) {
    return Member(
      name: name ?? this.name,
      paymentInfoList: paymentInfoList ?? this.paymentInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'paymentInfoList': this.paymentInfoList,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name'] as String,
      paymentInfoList: map['paymentInfoList'] as List<PaymentInfo>,
    );
  }

//</editor-fold>
}
