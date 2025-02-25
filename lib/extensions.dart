import 'package:path/path.dart' as p;

extension PathOps on String {
  String basename() {
    return p.basename(this);
  }

  String basenameNoExt() {
    return p.withoutExtension(p.basename(this));
  }

  String dirname() {
    return p.dirname(this);
  }

  (String, String) splitext() {
    return (p.withoutExtension(this), p.withoutExtension(this));
  }
}
