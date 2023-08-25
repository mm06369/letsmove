import "dart:convert";
import "dart:math";

import "package:http/http.dart" as http;

class ExerciseProvider {
  Future<List<dynamic>> getExerciseName() async {
    final apiUrl =
        Uri.parse('https://exercisedb.p.rapidapi.com/exercises/bodyPartList');

    final headers = {
      'X-RapidAPI-Key': '4a70e440f2mshe97964314212622p11880ajsnb76046fd7f8c',
      'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
    };

    try {
      print("in provider http call");
      final response = await http.get(apiUrl, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Provider: $data");
        return data;
      } else {
        print("Response Status: ${response.statusCode}");
        return ["Error", response.statusCode.toString()];
      }
    } catch (error) {
      print("Error: ${error.toString()}");
      return ["Error", "$error"];
    }
  }
}

// void main(){
//   var a = ExerciseProvider();
//   a.getExerciseName();
// }