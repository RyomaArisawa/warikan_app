import 'package:intl/intl.dart';

class Formatter {
  //三桁区切り
  static final numberFormatter = NumberFormat("#,###");

  static String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('yyyy/MM/dd');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String formatCost(int cost) {
    final costFormatter = NumberFormat("#,###");
    String formattedCost = "￥${costFormatter.format(cost)}";
    return formattedCost;
  }
}
