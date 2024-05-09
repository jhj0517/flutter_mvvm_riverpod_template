import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/local/memo.dart';
import '../../../data/repositories/memo_repository.dart';
import '../../../di/dependency_injection.dart';

part 'memos.g.dart';

@riverpod
class Memos extends _$Memos {
  final repository = locator<MemoRepository>();

  @override
  FutureOr<List<Memo>> build() async {
    return await repository.readMemos();
  }

  Future<void> readMemo() async {
    state = AsyncData(await repository.readMemos());
  }

  Future<void> addMemo(Memo memo) async {
    await repository.addMemo(memo);
    readMemo();
  }

  Future<void> deleteMemo(Memo memo) async {
    await repository.deleteMemo(memo);
    readMemo();
  }

  Future<void> updateMemo(Memo memo) async {
    await repository.updateMemo(memo);
    readMemo();
  }
}