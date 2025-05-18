


import 'dart:convert';
import 'package:flutter_application_1/quote/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote () async{

 final response = 
 await http.get(
  Uri.parse("https://api.api-ninjas.com/v1/quotes"),

      headers : {
        
      'X-Api-Key': 'VxKqDHzHbF/Lol2se2Kf7g==savW70OWbxzO0Ycj',

      },
 
 
 
);


if  (response.statusCode == 200){

   List <dynamic>data = jsonDecode(response.body);



  return    data.map((json)=> Quote.fromJson(json)).toList();



  
}

throw Exception("Failed to load data ");


}