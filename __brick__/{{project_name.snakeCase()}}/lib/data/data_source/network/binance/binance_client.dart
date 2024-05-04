import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/network/binance/orderbook_response.dart';
part 'binance_client.g.dart';

/// Example network retrofit class for the Binance. You can change it to your own.
/// API Documentation : https://binance-docs.github.io/apidocs/spot/en/#order-book

@RestApi()
abstract class BinanceClient {
  factory BinanceClient(Dio dio, {String baseUrl}) = _BinanceClient;

  @GET("depth")
  Future<OrderBookResponse> getOrderBooks({
    @Query('symbol') required String symbol,
    @Query('limit') int? limit,
  });
}