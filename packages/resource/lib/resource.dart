library resource;

export 'gen/_gen.dart';
export 'config/_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:resource/gen/assets.gen.dart';

extension ResourceEx on String? {
  static final RegExp _urlRegex = RegExp(r"^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+[\w\-.,@?^=%&:/~\\+#]*$");

  String get resource => '${Resource.assetResource}/${this ?? ''}';

  bool get isUrl => _urlRegex.hasMatch(this ?? '');

  String? get fullPath {
    String? path;
    if (this != null) {
      if (isUrl) {
        path = this;
      } else {
        path = '${dotenv.env['MEDIA_URL']}$this';
      }
    }
    return path;
  }
}

class Resource {
  Resource._();
  static const assetResource = 'packages/resource';
  static DotEnv env = dotenv;

  static Future<void> initEnv() async {
    await dotenv.load(fileName: AppAssets.env.production.resource);
  }
}
