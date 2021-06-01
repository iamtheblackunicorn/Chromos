/*
Chromos Lang by Alexander Abraham, "The Black Unicorn".
This interpreter is written for the Chromos "esolang".
Licensed under the MIT license.
*/

import 'engine.dart';
import 'package:termstyle/termstyle.dart';

/// This method provides
/// some helpful info
/// about the usage of the command-line tool.
void helpInfo() {
  String myHelpString =
      '--version     prints version info\n--help        prints this\n[code file]   run a program';
  String helpString = getColoredString('$myHelpString', 'red');
  print(helpString);
}

/// This method provides
/// some version info
/// about the command-line tool.
void versionInfo() {
  String version = '1.0.0';
  String rainbow = getEmoji('rainbow');
  String infoString =
      'Chromos $rainbow v.$version\nby Alexander Abraham, "The Black Unicorn"\nLicensed under the MIT license.';
  String coloredInfo = getColoredString('$infoString', 'cyan');
  print(coloredInfo);
}

/// This method executes a program
/// and prints out the result.
void runProgram(String progName) {
  Map<String, List<String>> blockData = isolateBlocks(progName);
  for (int i = 0; i < blockData.length; i++) {
    String key = blockData.keys.elementAt(i);
    String data = blockData[key].join('');
    if (blockData[key].length > 1) {
      data = blockData[key].join(' ');
    } else {
    }
    printColoredString(data, 'magenta');
  }
}
