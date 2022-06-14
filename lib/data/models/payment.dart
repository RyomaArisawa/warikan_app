class Payment {
  //支払い項目名
  String title;
  //支払い金額
  int cost;

//<editor-fold desc="Data Methods">

  factory Payment.init() {
    return Payment(title: "", cost: 0);
  }

  Payment({
    required this.title,
    required this.cost,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          cost == other.cost);

  @override
  int get hashCode => title.hashCode ^ cost.hashCode;

  @override
  String toString() {
    return 'Payment{' + ' title: $title,' + ' cost: $cost,' + '}';
  }

  Payment copyWith({
    String? title,
    int? cost,
  }) {
    return Payment(
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

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      title: map['title'] as String,
      cost: map['cost'] as int,
    );
  }

//</editor-fold>
}
