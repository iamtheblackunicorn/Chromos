/*
Chromos Lang by Alexander Abraham, "The Black Unicorn".
This interpreter is written for the Chromos "esolang".
Licensed under the MIT license.
*/

/// This method holds the regular expressions
/// that make the Chromos language work
/// and determine its syntax.
Map<String, RegExp> patterns() {
  Map<String, RegExp> tokens = {
    'START': RegExp(r'(prog start)'),
    'COMMENT': RegExp(r'\/\/\s(.*)'),
    'MESSAGE_START': RegExp(r'\s\smessage\sstart\s\=\>\s"([0-9]+)"'),
    'COMPUTE_PLUS_START': RegExp(r'\s\scomputePlus\sstart\s\=\>\s"([0-9]+)"'),
    'COMPUTE_MINUS_START': RegExp(r'\s\scomputeMinus\sstart\s\=\>\s"([0-9]+)"'),
    'COMPUTE_TIMES_START': RegExp(r'\s\scomputeTimes\sstart\s\=\>\s"([0-9]+)"'),
    'COMPUTE_BY_START': RegExp(r'\s\scomputeBy\sstart\s\=\>\s"([0-9]+)"'),
    'HEXNUMBER': RegExp(r'\s\s\s\s([A-F0-9]+)'),
    'MESSAGE_END': RegExp(r'\s\smessage\send\s\=\>\s"([0-9]+)"'),
    'COMPUTE_END': RegExp(r'\s\scompute\send\s\=\>\s"([0-9]+)"'),
    'END': RegExp(r'(prog end)'),
  };
  return tokens;
}
