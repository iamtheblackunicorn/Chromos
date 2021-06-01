/*
Chromos Lang by Alexander Abraham, "The Black Unicorn".
This interpreter is written for the Chromos "esolang".
Licensed under the MIT license.
*/

import 'dart:io';

/// This method returns the index of a certain map item.
int searchForIndexFromString(
    List<Map<String, String>> base, String item, String data) {
  int result = 0;
  for (int i = 0; i < base.length; i++) {
    Map<String, String> currMap = base[i];
    String currKey = currMap.keys.elementAt(0);
    String currData = currMap[currKey] as String;
    assert(currData is String);
    if (currKey == item && currData == data) {
      result = base.indexOf(currMap);
      break;
    } else {
      // Do nothing.
    }
  }
  return result;
}

/// This method returns the contents of
/// a file as a string.
String getFileContents(String fileName) {
  return File(fileName).readAsStringSync();
}
