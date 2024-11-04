import 'dart:convert';


import 'package:http/http.dart';



import '../../model/ebookmodel.dart';
import '../apiclient.dart';


class EbookApi {
  ApiClient apiClient = ApiClient();


  Future<Ebook> getEbook() async {
    String trendingpath = 'https://all-books-api.p.rapidapi.com/getBooks';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Ebook.fromJson(jsonDecode(response.body));
  }
}