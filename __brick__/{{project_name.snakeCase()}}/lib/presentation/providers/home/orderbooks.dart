import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/network/binance/orderbook_response.dart';
import '../../../data/repositories/binance_repository.dart';
import '../../../di/dependency_injection.dart';

part 'orderbooks.g.dart';

@riverpod
class OrderBooks extends _$OrderBooks {
  final repository = locator<BinanceRepository>();

  @override
  FutureOr<OrderBookResponse?> build() async {
    return null;
  }

  Future<void> fetchOrderBook({
    required String symbol,
    int? limit
  }) async {
    state = AsyncData(await repository.fetchOrderBooks(symbol: symbol, limit: limit));
  }
}