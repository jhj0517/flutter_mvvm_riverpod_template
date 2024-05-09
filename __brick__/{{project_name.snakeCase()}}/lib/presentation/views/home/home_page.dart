import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/providers.dart';
import '../widgets/common/common.dart';
import 'widgets/memo_tile.dart';
import 'widgets/memo_input_field.dart';

class MyHomePage extends ConsumerStatefulWidget  {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async{
  }

  @override
  Widget build(BuildContext context) {
    final memos = ref.watch(memosProvider);
    final orderBooks = ref.watch(orderBooksProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: NormalAppBar(title: Intl.message("appTitle")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          OutlinedButton(
              onPressed: () async {
                await ref.read(orderBooksProvider.notifier).fetchOrderBook(symbol: "BTCUSDT");
                debugPrint("TEST: ${orderBooks.value?.toJson()}");
              },
              child: const Text("DEBUG RETROFIT")
          ),
          const SizedBox(height: 20),
          const MemoInputField(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: memos.value?.length ?? 0,
              itemBuilder: (context, index) {
                final memo = memos.value?[index];
                return MemoTile(memo: memo);
              },
            ),
          )
        ],
      )
    );
  }
}
