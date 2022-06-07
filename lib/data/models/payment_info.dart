class PaymentInfo {
  //支払い項目名
  String title;
  //支払い金額
  int cost;

//<editor-fold desc="Data Methods">
  factory PaymentInfo.init() {
    return PaymentInfo(title: "", cost: 0);
  }

  PaymentInfo({
    required this.title,
    required this.cost,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentInfo &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          cost == other.cost);

  @override
  int get hashCode => title.hashCode ^ cost.hashCode;

  @override
  String toString() {
    return 'PaymentInfo{' + ' title: $title,' + ' cost: $cost,' + '}';
  }

  PaymentInfo copyWith({
    String? title,
    int? cost,
  }) {
    return PaymentInfo(
      title: title ?? this.title,
      cost: cost ?? this.cost,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'cost': this.cost,
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      title: map['title'] as String,
      cost: map['cost'] as int,
    );
  }

//</editor-fold>
}
