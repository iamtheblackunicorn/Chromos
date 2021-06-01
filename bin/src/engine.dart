/*
Chromos Lang by Alexander Abraham, "The Black Unicorn".
This interpreter is written for the Chromos "esolang".
Licensed under the MIT license.
*/

import 'data.dart';
import 'utils.dart';
import 'execution.dart';
import 'package:harpo/harpo.dart';

/// This method gets all the matched patterns in a line of code
/// and returns them as a table of the format [TOKEN_NAME: MATCHED_TOKEN].
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

/// This method actually tries to build a parse tree of
/// the code that is fed into the program.
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

/// This method tries to isolate all the blocks within
/// Chromos code and then returns them.
Map<String, List<String>> isolateBlocks(String progName) {
  var parseTree = retrieveData(progName);
  int parseTreeLength = parseTree.length;
  Map<String, List<String>> result = {};
  for (int i = 0; i < parseTreeLength; i++) {
    Map<String, String> currentMap = parseTree[i];
    int mapIndex = parseTree.indexOf(currentMap);
    String currentKey = currentMap.keys.elementAt(0);
    String keyData = currentMap[currentKey];
    if (currentKey == 'COMMENT') {
    } else if (currentKey == 'START') {
    } else if (currentKey == 'END') {
    } else if (currentKey == 'MESSAGE_START') {
      int endIndex =
          searchForIndexFromString(parseTree, 'MESSAGE_END', keyData);
      int startIndex = mapIndex + 1;
      int diff = endIndex - startIndex;
      List<String> blockChars = [];
      for (int t = startIndex; t < endIndex; t++) {
        Map<String, String> hexNumTokenPair = parseTree[t];
        String tokenKey = hexNumTokenPair.keys.elementAt(0);
        String hexNum = hexNumTokenPair[tokenKey];
        if (hexToDec(hexNum) > 26 || hexToDec(hexNum) > 25) {
          String numberChar = hexToDec(hexNum).toString();
          blockChars.add(numberChar);
        } else {
          String alphaChar = decryptLetter(1, hexToDec(hexNum));
          blockChars.add(alphaChar);
        }
      }
      result.addAll({keyData: blockChars});
    } else if (currentKey == 'COMPUTE_PLUS_START') {
      int endIndex =
          searchForIndexFromString(parseTree, 'COMPUTE_END', keyData);
      int startIndex = mapIndex + 1;
      int diff = endIndex - startIndex;
      List<String> blockChars = [];
      for (int t = startIndex; t < endIndex; t++) {
        Map<String, String> hexNumTokenPair = parseTree[t];
        String tokenKey = hexNumTokenPair.keys.elementAt(0);
        String hexNum = hexNumTokenPair[tokenKey];
        if (hexToDec(hexNum) > 26 || hexToDec(hexNum) > 25) {
          String numberChar = hexToDec(hexNum).toString();
          blockChars.add(numberChar);
        } else {
          String alphaChar = decryptLetter(1, hexToDec(hexNum));
          blockChars.add(alphaChar);
        }
      }
      String res = addListOfNums(blockChars);
      result.addAll({
        keyData: [res]
      });
    } else if (currentKey == 'COMPUTE_MINUS_START') {
      int endIndex =
          searchForIndexFromString(parseTree, 'COMPUTE_END', keyData);
      int startIndex = mapIndex + 1;
      int diff = endIndex - startIndex;
      List<String> blockChars = [];
      for (int t = startIndex; t < endIndex; t++) {
        Map<String, String> hexNumTokenPair = parseTree[t];
        String tokenKey = hexNumTokenPair.keys.elementAt(0);
        String hexNum = hexNumTokenPair[tokenKey];
        if (hexToDec(hexNum) > 26 || hexToDec(hexNum) > 25) {
          String numberChar = hexToDec(hexNum).toString();
          blockChars.add(numberChar);
        } else {
          String alphaChar = decryptLetter(1, hexToDec(hexNum));
          blockChars.add(alphaChar);
        }
      }
      String res = subListOfNums(blockChars);
      result.addAll({
        keyData: [res]
      });
    } else if (currentKey == 'COMPUTE_TIMES_START') {
      int endIndex =
          searchForIndexFromString(parseTree, 'COMPUTE_END', keyData);
      int startIndex = mapIndex + 1;
      int diff = endIndex - startIndex;
      List<String> blockChars = [];
      for (int t = startIndex; t < endIndex; t++) {
        Map<String, String> hexNumTokenPair = parseTree[t];
        String tokenKey = hexNumTokenPair.keys.elementAt(0);
        String hexNum = hexNumTokenPair[tokenKey];
        if (hexToDec(hexNum) > 26 || hexToDec(hexNum) > 25) {
          String numberChar = hexToDec(hexNum).toString();
          blockChars.add(numberChar);
        } else {
          String alphaChar = decryptLetter(1, hexToDec(hexNum));
          blockChars.add(alphaChar);
        }
      }
      String res = mulListOfNums(blockChars);
      result.addAll({
        keyData: [res]
      });
    } else if (currentKey == 'COMPUTE_BY_START') {
      int endIndex =
          searchForIndexFromString(parseTree, 'COMPUTE_END', keyData);
      int startIndex = mapIndex + 1;
      int diff = endIndex - startIndex;
      List<String> blockChars = [];
      for (int t = startIndex; t < endIndex; t++) {
        Map<String, String> hexNumTokenPair = parseTree[t];
        String tokenKey = hexNumTokenPair.keys.elementAt(0);
        String hexNum = hexNumTokenPair[tokenKey];
        if (hexToDec(hexNum) > 26 || hexToDec(hexNum) > 25) {
          String numberChar = hexToDec(hexNum).toString();
          blockChars.add(numberChar);
        } else {
          String alphaChar = decryptLetter(1, hexToDec(hexNum));
          blockChars.add(alphaChar);
        }
      }
      String res = divListOfNums(blockChars);
      result.addAll({
        keyData: [res]
      });
    } else {
      // Do nothing.
    }
  }
  return result;
}
