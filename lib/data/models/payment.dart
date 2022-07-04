import 'package:uuid/uuid.dart';

class Payment {
  //支払い項目ID
  final String paymentId;
  //支払い項目名
  String item;
  //支払い金額
  int cost;

//<editor-fold desc="Data Methods">
  factory Payment.init() {
    return Payment(paymentId: Uuid().v4(), item: "", cost: 0);
  }

  Payment({
    required this.paymentId,
    required this.item,
    required this.cost,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          runtimeType == other.runtimeType &&
          paymentId == other.paymentId &&
          item == other.item &&
          cost == other.cost);

  @override
  int get hashCode => paymentId.hashCode ^ item.hashCode ^ cost.hashCode;

  @override
  String toString() {
    return 'Payment{' +
        ' paymentId: $paymentId,' +
        ' item: $item,' +
        ' cost: $cost,' +
        '}';
  }

  Payment copyWith({
    String? paymentId,
    String? item,
    int? cost,
  }) {
    return Payment(
      paymentId: paymentId ?? this.paymentId,
      item: item ?? this.item,
      cost: cost ?? this.cost,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'paymentId': this.paymentId,
      'item': this.item,
      'cost': this.cost,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      paymentId: map['paymentId'] as String,
      item: map['item'] as String,
      cost: map['cost'] as int,
    );
  }

//</editor-fold>
}
