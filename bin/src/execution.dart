/*
Chromos Lang by Alexander Abraham, "The Black Unicorn".
This interpreter is written for the Chromos "esolang".
Licensed under the MIT license.
*/

/// This method adds up a list of numbers
/// and converts the resulting int to a string.
String addListOfNums(List<String> dataSet) {
  int result = int.parse(dataSet[0]);
  for (int i = 1; i < dataSet.length; i++) {
    result = result + int.parse(dataSet[i]);
  }
  return result.toString();
}

/// This method subtracts a list of numbers
/// and converts the resulting int to a string.
String subListOfNums(List<String> dataSet) {
  int result = int.parse(dataSet[0]);
  for (int i = 1; i < dataSet.length; i++) {
    result = result - int.parse(dataSet[i]);
  }
  return result.toString();
}

/// This method multiplies a list of numbers
/// and converts the resulting int to a string.
String mulListOfNums(List<String> dataSet) {
  int result = int.parse(dataSet[0]);
  for (int i = 1; i < dataSet.length; i++) {
    result = result * int.parse(dataSet[i]);
  }
  return result.toString();
}

/// This method divides a list of numbers
/// and converts the resulting int to a string.
String divListOfNums(List<String> dataSet) {
  int result = int.parse(dataSet[0]);
  for (int i = 1; i < dataSet.length; i++) {
    result = (result / int.parse(dataSet[i])).round();
  }
  return result.toString();
}
