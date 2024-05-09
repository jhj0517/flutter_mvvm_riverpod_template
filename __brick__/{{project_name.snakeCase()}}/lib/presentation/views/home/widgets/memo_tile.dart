import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/models.dart';
import '../../../providers/home/memos.dart';

class MemoTile extends ConsumerWidget {
  final Memo? memo;

  const MemoTile({
    super.key,
    required this.memo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (memo==null){
      return const SizedBox.shrink();
    }

    return ListTile(
      title: Text('Name: ${memo!.content}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          final memoNotifier = ref.read(memosProvider.notifier);
          memoNotifier.deleteMemo(memo!);
        }
      ),
    );
  }
}