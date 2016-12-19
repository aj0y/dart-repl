import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'code.dart' as code;


execute(code.Code newCode) async {

  final File file = new File('temp.dart');
  var output = file.openWrite();

  output.write(newCode.generateText());
  output.close();

  ProcessResult pr = await Process.run('dart', ['temp.dart']);
  print(pr.exitCode);
  print(pr.stdout);
  print(pr.stderr);
}

main(List<String> arguments) async {

  var newCode = new code.Code();
  String line = '';
  bool notInstantExecute = true;
  print(' ===============================');
  print('||          Dart REPL          ||');
  print(' ===============================');
  print('type "." to exit \n');
  do {
    stdout.write('dart>');
    line = stdin.readLineSync();

    if (line != '.') {
      notInstantExecute = newCode.analyzeLine(line);
    } else {
      notInstantExecute = true;
    }

    if (!notInstantExecute) {
      await execute(newCode);
    }

  } while(line != '.');

  print('Quit.');
}

