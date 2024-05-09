import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/models.dart';
import '../../../providers/providers.dart';

class MemoInputField extends ConsumerStatefulWidget {
  const MemoInputField({super.key});

  @override
  MemoInputFieldState createState() => MemoInputFieldState();
}

class MemoInputFieldState extends ConsumerState<MemoInputField> {
  final _memoController = TextEditingController();

  @override
  void dispose() {
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _memoController,
      decoration: InputDecoration(
          labelText: 'Enter Your Memo',
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (_memoController.text.isNotEmpty) {
                final memoNotifier = ref.read(memosProvider.notifier);
                memoNotifier.addMemo(Memo(
                    content: _memoController.text,
                    isImportant: false
                ));
                _memoController.clear();
              }
            },
          )
      ),
    );
  }
}