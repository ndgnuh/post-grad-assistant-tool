/// this package is for generating source code
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'annotations.dart';

class DbTableGenerator extends GeneratorForAnnotation<DbTable> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final table = annotation.read('table').literalValue as String;
    return "static const table = $table;";
  }
}

Builder dbTableBuilder(BuilderOptions options) {
  return SharedPartBuilder([DbTableGenerator()], "dbtable");
}
