import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedox/pokemodel.dart';


List<PokeModel> pokeList = [];
Future<List<PokeModel>> getPokeDetails()async{
  
  final response = await http.get(Uri.parse("https://webhook.site/e1034949-efa9-49a4-a7d1-53dd2c71fd8d"));

  var data = jsonDecode(response.body.toString());

  if(response.statusCode == 200){
    for(Map i in data){
    pokeList.add(PokeModel.fromJson(i));
    }return pokeList;
  }else{
    return pokeList;
  }
}