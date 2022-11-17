import 'dart:io';

import 'src/generator.dart';

Future<void> main(List<String> args) async {
  late int varNumber;
  if (args.isNotEmpty) {
    try {
      varNumber = int.parse(args[0]);
    } on FormatException {
      print('Parameter should contain number');
      exit(0);
    }
  } else {
    varNumber = 5;
  }
  Generator().run(varNumber: varNumber);
}
