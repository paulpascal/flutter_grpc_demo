import 'package:grpc/grpc.dart';

class GrpcClientSingleton {
  static const _serverIp = '10.0.2.2';
  static const _serverPort = 8080;

  late ClientChannel clientChannel;
  static final GrpcClientSingleton _singleton = GrpcClientSingleton._internal();

  factory GrpcClientSingleton() => _singleton;

  GrpcClientSingleton._internal() {
    clientChannel = ClientChannel(
      _serverIp, // Use your IP address where the server is running
      port: _serverPort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(minutes: 1),
      ),
    );
  }
}
