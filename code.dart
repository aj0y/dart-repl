
class Code {
  // collects all the imports
  List<String> imports = [];

  //
  List<String> functions = [];

  //
  List<String> statements = [];

  // stores all the lines imported so far
  List<String> lines = [];

  // generate code
  String text;

  //
  bool insideFunction = false;

  Code() {
    this.imports.add("import 'dart:io'");
  }

  /**
   *
   */
  bool analyzeLine(String line) {
    lines.add(line);

    if(line.startsWith('import ')) {
      this.imports.add(line);
      return true;

    } else if (line.isNotEmpty) {
      this.statements.add(line);

      return this.insideFunction;
    }
    return true;
  }

  /**
   *
   */
  String generateText() {

    // convert imports to text
    String importsText = '';
    this.imports.forEach((importLine) => importsText += importLine + ';\n');

    String statementsText = '';
    this.statements.forEach((statementLine) => statementsText += '\t' + statementLine + ';\n');

    this.text = importsText +
      "\nmain() async {\n\t" +
        statementsText +
        "\n}\n";

    return this.text;
  }
}
