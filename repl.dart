import 'dart:io';

main() async {

  final File file = new File('temp.dart');
  var output = file.openWrite();

  stdout.write('dart>');
  var line = stdin.readLineSync(encoding: SYSTEM_ENCODING);
  output.write("import 'dart:io';\n");
  output.write("main(){\n\t");
  output.write(line);
  output.write(";\n}\n");
  output.close();

  ProcessResult pr = await Process.run('dart', ['temp.dart']);
  print(pr.exitCode);
  print(pr.stdout);
  print(pr.stderr);
}