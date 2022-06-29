class Payment {
  //支払い項目名
  String item;
  //支払い金額
  int cost;

//<editor-fold desc="Data Methods">

  factory Payment.init() {
    return Payment(item: "", cost: 0);
  }

  Payment({
    required this.item,
    required this.cost,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          runtimeType == other.runtimeType &&
          item == other.item &&
          cost == other.cost);

  @override
  int get hashCode => item.hashCode ^ cost.hashCode;

  @override
  String toString() {
    return 'Payment{' + ' title: $item,' + ' cost: $cost,' + '}';
  }

  Payment copyWith({
    String? title,
    int? cost,
  }) {
    return Payment(
      item: title ?? this.item,
      cost: cost ?? this.cost,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.item,
      'cost': this.cost,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      item: map['title'] as String,
      cost: map['cost'] as int,
    );
  }

//</editor-fold>
}
