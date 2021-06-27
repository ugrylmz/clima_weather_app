import 'package:http/http.dart' as http;
import 'dart:convert' as conv;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async{
    http.Response response =  await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var decodedData = conv.jsonDecode(response.body);
      return decodedData;
    }else{
      print(response.body.isEmpty);
      print(response.statusCode);
    }
  }

}