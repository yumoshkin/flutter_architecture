import 'dart:io';
import 'dart:core';
import 'package:path/path.dart' as path;
import 'package:dart_style/dart_style.dart';

const localizationPath = 'packages/codegen_package';

class Generator {
  static const _outputFileName = 'env_variables.g.dart';
  final _prologue = '''
// DO NOT EDIT. This is code generated via code generator

class EnvironmentVariables {  
''';
  final _epilogue = '}';

  String _getProperty(String value, String propertyName) => """
  String get $propertyName => '$value';
""";

  void run({
    required int varNumber,
  }) {
    print('Generation is started');

    final outputFile =
        path.join(Directory.current.path, 'lib/$_outputFileName');
    final output = StringBuffer();

    output.writeln(_prologue);

    for (final entry in Platform.environment.entries.take(varNumber)) {
      output.writeln(_getProperty(entry.value, entry.key.toLowerCase()));
    }

    output.writeln(_epilogue);

    final formattedCode = DartFormatter().format(output.toString());
    File(outputFile).writeAsStringSync(formattedCode);

    print('Generation is finished');
  }
}
