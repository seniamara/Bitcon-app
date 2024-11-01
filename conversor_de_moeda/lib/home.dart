import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController moedaController = TextEditingController();

  // Variável de classe para armazenar o resultado
  String _resultado = "";

  _recuperarCep() async {
    String url = "http://viacep.com.br/ws/01001000/json/";
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "$bairro, $complemento, $localidade";
    });
  }

  TextEditingController _controllercep = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo web'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Exibe o resultado atualizado
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Digite o cep EX: 05428200"),
              style: TextStyle(fontSize: 20),
            controller: _controllercep,
            ),
            
            TextButton(
              onPressed: () {
                _recuperarCep();
              },
              child: Text("Clica aqui"),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
