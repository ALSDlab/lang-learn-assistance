import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/env/.env', useConstantCase: true)
abstract class Env {

  // GEMINI_API_KEY
  @EnviedField()
  static const String geminiApiKey = _Env.geminiApiKey;

}