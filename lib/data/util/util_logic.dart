import 'package:warikan_app/data/models/split.dart';

class UtilLogic {
  static sortCostDesc(List list) {
    return list.sort((current, next) => -current.cost.compareTo(next.cost));
  }

  static sortNameAsc(List list) {
    return list.sort((current, next) => current.name.compareTo(next.name));
  }

  static sortDateDesc(List list) {
    return list
        .sort((current, next) => -current.createdAt.compareTo(next.createdAt));
  }

  static sortIsSettle(List<Split> list) {
    return list.sort((current, next) {
      if (next.isSettled) {
        return -1;
      }
      return 1;
    });
  }
}
