import 'dart:io';
import 'package:harpo/harpo.dart';
import 'package:termstyle/termstyle.dart';

int searchForIndexFromString(List<Map<String, String>> base, String item, String data){
  int result = 0;
  for (int i = 0; i < base.length; i++){
    Map<String, String> currMap = base[i];
    String currKey = currMap.keys.elementAt(0);
    String currData = currMap[currKey];
    if (currKey == item && currData == data){
      result = base.indexOf(currMap);
      break;
    }
    else {
      // Do nothing.
    }
  }
  return result;
}

Map<String, String> getPatternData(
    String patternName, RegExp pattern, String subjectString) {
  Map<String, String> data = {};
  Iterable<Match> matchObj = pattern.allMatches(subjectString);
  int matchObjLength = matchObj.length;
  for (int x = 0; x < matchObjLength; x++) {
    Match lineMatchGroups = matchObj.elementAt(x);
    int groupLength = lineMatchGroups.groupCount + 1;
    for (int z = 1; z < groupLength; z++) {
      String matchData = lineMatchGroups.group(z);
      data.addAll({patternName: matchData});
    }
  }
  return data;
}

Map<String, RegExp> patterns() {
  Map<String, RegExp> tokens = {
    'START': RegExp(r'(prog start)'),
    'COMMENT': RegExp(r'\?\?\s(.*)'),
    'MESSAGE_START': RegExp(r'\s\smessage\sstart\s\=\>\s("[0-9]+")'),
    'COMPUTE_START':
        RegExp(r'\s\scompute\sstart\s(plus|minus|times|by)\s\=\>\s("[0-9]+")'),
    'HEXNUMBER': RegExp(r'\s\s\s\s([A-F0-9]+)'),
    'MESSAGE_END': RegExp(r'\s\smessage\send\s\=\>\s("[0-9]+")'),
    'COMPUTE_END': RegExp(r'\s\scompute\send\s\=\>\s("[0-9]+")'),
    'END': RegExp(r'(prog end)'),
  };
  return tokens;
}

List<Map<String, String>> retrieveData(String prog) {
  List<Map<String, String>> result = [];
  String progCode = getFileContents(prog);
  List<String> codeList = progCode.split('\n');
  Map<String, RegExp> tokens = patterns();
  for (int i = 0; i < codeList.length; i++) {
    String subjectString = codeList[i];
    for (int x = 0; x < tokens.length; x++) {
      String tokenKey = tokens.keys.elementAt(x);
      RegExp token = tokens[tokenKey];
      Map<String, String> progPatternData =
          getPatternData(tokenKey, token, subjectString);
      if (progPatternData.isEmpty == true || progPatternData == null) {
      } else {
        result.add(progPatternData);
      }
    }
  }
  return result;
}

List<String> tokenList(List<Map<String, String>> tokens) {
  List<String> result = [];
  for (int i = 0; i < tokens.length; i++) {
    Map<String, String> tokenPair = tokens[i];
    String tokenName = tokenPair.keys.elementAt(0);
    result.add(tokenName);
  }
  return result;
}

void helpInfo() {
  String myHelpString =
      '--version     prints version info\n--help        prints this\n[code file]   run a program';
  String helpString = getColoredString('$myHelpString', 'red');
  print(helpString);
}

void versionInfo() {
  String version = '1.0.0';
  String rainbow = getEmoji('rainbow');
  String infoString =
      'Chromos $rainbow v.$version\nby Alexander Abraham, "The Black Unicorn"\nLicensed under the MIT license.';
  String coloredInfo = getColoredString('$infoString', 'cyan');
  print(coloredInfo);
}

Map<String, List<String>> isolateBlocks(String progName) {
  var parseTree = retrieveData(progName);
  int parseTreeLength = parseTree.length;
  Map<String, List<String>> result = {};
  for (int i = 0; i < parseTreeLength; i++) {
    Map<String, String> currentMap = parseTree[i];
    int mapIndex = parseTree.indexOf(currentMap);
    String currentKey = currentMap.keys.elementAt(0);
    String keyData = currentMap[currentKey];
    if (currentKey == 'COMMENT') {}
    else if (currentKey == 'START') {}
    else if (currentKey == 'END') {}
    else if (currentKey == 'MESSAGE_START') {
      int endIndex = searchForIndexFromString(parseTree, 'MESSAGE_END', keyData);
      int startIndex = mapIndex + 1;
      int diff = endIndex - startIndex;
      List<String> blockChars = [];
      for (int t = startIndex; t < endIndex; t++ ){
        Map<String,String> hexNumTokenPair = parseTree[t];
        String tokenKey = hexNumTokenPair.keys.elementAt(0);
        String hexNum = hexNumTokenPair[tokenKey];
        if (hexToDec(hexNum) > 26 || hexToDec(hexNum) > 25){
          String numberChar = hexToDec(hexNum).toString();
          blockChars.add(numberChar);
        }
        else {
          String alphaChar = decryptLetter(1,hexToDec(hexNum));
          blockChars.add(alphaChar);
        }
      }
      result.addAll({
        keyData:blockChars
      });
    }
    else {
      // Do nothing.
    }
  }
  return result;
}

void runProgram(String progName) {
  Map<String, List<String>> blockData = isolateBlocks(progName);
  print(blockData);
  for (int i = 0; i < blockData.length; i++) {
    print(blockData[i]);
  }
}

String getFileContents(String fileName) {
  return File(fileName).readAsStringSync();
}

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
