import 'dart:convert';
import "package:http/http.dart" as http;

Future<Map> getData() async {
  // Converta a string da URL em um objeto Uri
  final Uri request = Uri.parse("https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_35kJh8EIax9VAY1wVxR3ifYoABFPGi88xZnf3bWX");

  // Faz a requisição HTTP
  http.Response response = await http.get(request);

  // Verifica se a requisição foi bem-sucedida
  if (response.statusCode == 200) {
    // Retorne os dados decodificados em formato JSON
    return json.decode(response.body);
  } else {
    // Se houver um erro, lance uma exceção
    throw Exception("Falha ao carregar os dados");
  }
}
