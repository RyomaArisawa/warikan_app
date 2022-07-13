import 'package:uuid/uuid.dart';
import 'package:split/data/db/memo_dao.dart';
import 'package:split/data/models/memo.dart';
import 'package:split/data/models/user.dart';

class MemoRepository {
  MemoRepository({required this.memoDao});
  MemoDao memoDao;

  ///メモ情報登録
  Future<void> insertMemo(
      {required String title,
      required String content,
      required User user}) async {
    //メモ情報を生成
    final memo = Memo(
      id: const Uuid().v4(),
      uid: user.id,
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );

    await memoDao.insertMemo(memo);
  }

  ///メモ情報更新
  Future<void> updateMemo({
    required String title,
    required String content,
    required Memo memo,
  }) async {
    final updatedMemo = memo.copyWith(
        title: title, content: content, createdAt: DateTime.now());

    await memoDao.updateMemo(updatedMemo);
  }

  ///メモ情報取得
  Future<List<Memo>> getMemoByUserId(String uid) async {
    final memos = <Memo>[];

    final queryData = await memoDao.getMemoByUserId(uid);
    //DBから取得した情報をMemoクラスへ変換
    for (var data in queryData) {
      memos.add(Memo.fromMap(data.data()));
    }

    return memos;
  }

  Future<void> deleteMemo(Memo memo) async {
    await memoDao.deleteMemo(memo);
  }
}
