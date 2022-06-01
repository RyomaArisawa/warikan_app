class PaymentInfo {
  String title;
  String amountOfMoney;

//<editor-fold desc="Data Methods">

  PaymentInfo({
    required this.title,
    required this.amountOfMoney,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentInfo &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          amountOfMoney == other.amountOfMoney);

  @override
  int get hashCode => title.hashCode ^ amountOfMoney.hashCode;

  @override
  String toString() {
    return 'PaymentInfo{' +
        ' title: $title,' +
        ' amountOfMoney: $amountOfMoney,' +
        '}';
  }

  PaymentInfo copyWith({
    String? title,
    String? amountOfMoney,
  }) {
    return PaymentInfo(
      title: title ?? this.title,
      amountOfMoney: amountOfMoney ?? this.amountOfMoney,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'amountOfMoney': this.amountOfMoney,
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      title: map['title'] as String,
      amountOfMoney: map['amountOfMoney'] as String,
    );
  }

//</editor-fold>

}
