import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/env/.env', useConstantCase: true)
abstract class Env {

  // CHATGPT_API_KEY
  @EnviedField()
  static const String chatgptApiKey = _Env.chatgptApiKey;

}