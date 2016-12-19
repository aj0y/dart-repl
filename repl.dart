import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'code.dart' as code;

main(List<String> arguments) async {

  final File file = new File('temp.dart');
  var output = file.openWrite();

  var newCode = new code.Code();
  String line = '';
  do {
    stdout.write('dart>');
    line = stdin.readLineSync();

    if (line != '.') {
      newCode.analyzeLine(line);
    }

  } while(line != '.');

  output.write(newCode.generateText());
  output.close();

  ProcessResult pr = await Process.run('dart', ['temp.dart']);
  print(pr.exitCode);
  print(pr.stdout);
  print(pr.stderr);
}

