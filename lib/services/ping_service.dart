import 'dart:math';

import 'package:demo_grpc/commons/grpc_commons.dart';
import 'package:demo_grpc/proto/service.pb.dart';
import 'package:demo_grpc/proto/service.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

class PingService {
  static Future<PongResponse> ping(String message) async {
    final _client = ServiceClient(GrpcClientSingleton().clientChannel);
    final _request = PingRequest()
      ..message = message
      ..id = Int64(Random().nextInt(1000));
    return await _client.ping(_request);
  }
}
