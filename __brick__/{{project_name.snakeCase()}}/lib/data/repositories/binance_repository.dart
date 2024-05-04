import '../models/network/binance/orderbook_response.dart';
import '../network/binance/binance_client.dart';

class BinanceRepository{

  BinanceRepository({
    required this.client,
  });

  final BinanceClient client;

  Future<OrderBookResponse> fetchOrderBooks({
    required String symbol,
    int? limit
  }) => client.getOrderBooks(
      symbol: symbol,
      limit: limit
  );

}