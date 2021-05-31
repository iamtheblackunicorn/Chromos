import 'dart:io';

Map<String,String> getPatternData(
  String patternName,
  RegExp pattern,
  String subjectString
){
  Map<String,String> data = {};
  Iterable<Match> matchObj = pattern.allMatches(subjectString);
  int matchObjLength = matchObj.length;
  for (int x = 0; x < matchObjLength; x++){
    Match lineMatchGroups = matchObj.elementAt(x);
    int groupLength = lineMatchGroups.groupCount + 1;
    for (int z = 1; z < groupLength; z++){
      String matchData = lineMatchGroups.group(z);
      data.addAll({
        patternName:matchData
      });
    }
  }
  return data;
}

Map<String,RegExp> patterns(){
  Map<String,RegExp> tokens = {
    'START':RegExp(r'(prog start)'),
    'COMMENT':RegExp(r'\?\?\s(.*)'),
    'MESSAGE_START':RegExp(r'\s\smessage\sstart\s\=\>\s("[0-9]+")'),
    'COMPUTE_START':RegExp(r'\s\scompute\sstart\s(plus|minus|times|by)\s\=\>\s("[0-9]+")'),
    'HEXNUMBER':RegExp(r'\s\s\s\s([A-F0-9]+)'),
    'MESSAGE_END':RegExp(r'(\s\smessage end)'),
    'COMPUTE_END':RegExp(r'(\s\scompute end)'),
    'END':RegExp(r'(prog end)'),
  };
  return tokens;
}

List<Map<String,String>> retrieveData(String prog){
  List<Map<String,String>> result = [];
  String progCode = getFileContents(prog);
  List<String> codeList = progCode.split('\n');
  Map<String,RegExp> tokens = patterns();
  for (int i = 0; i < codeList.length;i++) {
    String subjectString = codeList[i];
    for (int x = 0; x < tokens.length; x++){
      String tokenKey = tokens.keys.elementAt(x);
      RegExp token = tokens[tokenKey];
      Map<String,String> progPatternData =
        getPatternData(
          tokenKey,
          token,
          subjectString
        );
      if (
        progPatternData.isEmpty == true
        || progPatternData == null
      ){}
      else {
        result.add(progPatternData);
      }
    }
  }
  return result;
}

List<String> tokenList(List<Map<String,String>> tokens){
  List<String> result = [];
  for (int i = 0; i < tokens.length;i++){
    Map<String,String> tokenPair = tokens[i];
    String tokenName = tokenPair.keys.elementAt(0);
    result.add(tokenName);
  }
  return result;
}

List<Map<String, dynamic>> executePrg(String fileName){
  List<Map<String, dynamic>> result = [];
  return result;
}



String getFileContents(String fileName){
  return File(fileName).readAsStringSync();
}

void main(){
  print(
    tokenList(
      retrieveData(
        'sample.chr'
      )
    )
  );
}
