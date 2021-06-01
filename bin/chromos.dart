/*
Chromos Lang by Alexander Abraham, "The Black Unicorn".
This interpreter is written for the Chromos "esolang".
Licensed under the MIT license.
*/

import 'src/cli.dart';
import 'package:termstyle/termstyle.dart';

/// This method is the main entry point
/// for the Dart VM but also the CLI's
/// main component.
void main(List<String> arguments) {
  if (arguments.length == 1) {
    if (arguments[0] == '--version') {
      versionInfo();
    } else if (arguments[0] == '--help') {
      helpInfo();
    } else {
      try {
        printColoredString(
            '${getEmoji('naughtyface')} Running your code...\n\n', 'cyan');
        runProgram(arguments[0]);
      } catch (e) {
        printColoredString(
            '${getEmoji('angryFace')} No valid input files!\n\n', 'red');
        helpInfo();
      }
    }
  } else {
    helpInfo();
  }
}
