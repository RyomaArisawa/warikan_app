import 'package:split/data/models/calc_result.dart';
import 'package:split/data/models/member.dart';
import 'package:split/data/models/split.dart';

class UtilLogic {
  ///支払額で降順ソート
  static sortCostDesc(List list) {
    return list.sort((current, next) => -current.cost.compareTo(next.cost));
  }

  ///名前で昇順ソート
  static sortNameAsc(List list) {
    return list.sort((current, next) => current.name.compareTo(next.name));
  }

  ///日付で降順ソート
  static sortDateDesc(List list) {
    return list
        .sort((current, next) => -current.createdAt.compareTo(next.createdAt));
  }

  ///精算済みでソート
  static sortIsSettle(List<Split> list) {
    return list.sort((current, next) {
      if (next.isSettled) {
        return -1;
      }
      return 1;
    });
  }

  ///支払額合計を算出
  static int calcTotalCost(List<Member> members) {
    var totalCost = 0;
    for (var member in members) {
      for (var payment in member.payments) {
        totalCost = totalCost + payment.cost;
      }
    }
    return totalCost;
  }

  ///割り勘結果を算出
  static List<CalcResult?> calcSplit(Split split) {
    //合計金額を算出
    final totalCost = calcTotalCost(split.members);
    //平均金額を算出
    final average = (totalCost / split.members.length).round();

    //差額リスト
    List<Map<String, dynamic>> balances = [];

    for (var member in split.members) {
      //メンバーごとの合憲金額
      var paidCost = 0;
      for (var payment in member.payments) {
        paidCost += payment.cost;
      }

      final balance = paidCost - average;
      balances.add({"member": member.name, "balance": balance});
    }

    //差額順に降順ソート
    balances.sort(
      (current, next) => -current["balance"].compareTo(next["balance"]),
    );

    //計算結果リスト
    List<CalcResult?> calcResults = [];

    while (balances.length > 1) {
      //債権者
      var maxBalance = balances[0];
      //債務者
      var minBalance = balances[balances.length - 1];

      //債権額と債務額を絶対値で比較
      final amount = maxBalance["balance"] < minBalance["balance"].abs()
          ? maxBalance["balance"]
          : minBalance["balance"].abs();

      //債権額と債務額が0の場合はループ終了
      if (amount == 0) {
        break;
      }

      //計算結果を格納
      final calcResult = CalcResult(
        sender: minBalance["member"],
        receiver: maxBalance["member"],
        amount: amount,
      );

      calcResults.add(calcResult);

      //債権者から減算
      maxBalance["balance"] -= amount;
      //債権額が0になった場合はリストから削除
      if (maxBalance["balance"] == 0) {
        balances.removeAt(0);
      }

      //債務者に加算
      minBalance["balance"] += amount;
      //債務額が0になった場合はリストから削除
      if (minBalance["balance"] == 0) {
        balances.removeAt(balances.length - 1);
      }
    }
    return calcResults;
  }
}
