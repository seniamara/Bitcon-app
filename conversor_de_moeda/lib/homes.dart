// Importa os pacotes necessários
import 'package:flutter/material.dart'; // Pacote para construir interfaces no Flutter
import 'package:http/http.dart' as http; // Pacote para realizar requisições HTTP
import 'dart:convert'; // Pacote para converter dados JSON para um mapa (Map)

class Homes extends StatefulWidget {
  const Homes({super.key}); // Define o widget Homes como um widget Stateful (com estado)

  @override
  State<Homes> createState() => _HomesState(); // Cria o estado para o widget Homes
}

class _HomesState extends State<Homes> {
  String _preco = "0"; // Define uma variável para armazenar o preço do Bitcoin

  // Função que busca o preço atualizado do Bitcoin
  void _recuperarPreco() async {
    // Define a URL da API de cotação do Bitcoin
    String url = "https://blockchain.info/ticker";

    // Realiza uma requisição GET na URL especificada
    http.Response response = await http.get(Uri.parse(url));

    // Verifica se a resposta da requisição foi bem-sucedida (código 200)
    if (response.statusCode == 200) {
      // Decodifica o JSON da resposta para um Map
      Map<String, dynamic> retorno = json.decode(response.body);

      // Atualiza a variável _preco com o valor de compra do Bitcoin (BRL - Real Brasileiro)
      setState(() {
        _preco = retorno["BRL"]["buy"].toString();
      });
    } else {
      // Atualiza a variável _preco com uma mensagem de erro em caso de falha
      setState(() {
        _preco = "Erro ao atualizar";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Constrói a interface do aplicativo
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32), // Define o preenchimento em torno do conteúdo
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente
            children: [
              Image.asset("assets/bitcoin.png"), // Exibe a imagem do Bitcoin
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30), // Adiciona espaço acima e abaixo do preço
                child: Text(
                  "Kz ${_preco}", // Exibe o preço atualizado com o prefixo "Kz"
                  style: TextStyle(fontSize: 35), // Define o tamanho da fonte
                ),
              ),
              Container(
                color: const Color(0xFFFF9400), // Define a cor de fundo do botão como amarelo
                child: GestureDetector(
                  onTap: _recuperarPreco, // Define a função a ser executada ao clicar no botão
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Define a área de clique do botão
                    child: Text(
                      "Atualizar", // Texto do botão
                      style: TextStyle(
                        color: Colors.white, // Cor do texto
                        fontSize: 20, // Tamanho da fonte do texto
                        fontWeight: FontWeight.bold, // Deixa o texto em negrito
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * Exercício Prático
Para praticar o uso desse código e aprofundar o aprendizado, tente os seguintes exercícios:

Modifique o Código para Outra Moeda:

Tente modificar o código para exibir o preço em outra moeda, como o dólar (USD) ou o euro (EUR), usando as chaves retorno["USD"]["buy"] ou retorno["EUR"]["buy"]. Atualize o prefixo do símbolo da moeda para refletir a nova moeda.
Adicionar Um Indicador de Carregamento:

Adicione um indicador de carregamento (como um CircularProgressIndicator) enquanto o aplicativo está buscando o preço do Bitcoin. Quando o preço for carregado, o indicador de carregamento deve desaparecer.
Exibir Mais Dados:

Modifique o layout para exibir o preço de venda (retorno["BRL"]["sell"]) junto com o preço de compra. Coloque os dois valores na tela com títulos para cada preço.
Esses exercícios ajudarão a praticar a leitura de dados de uma API, manipulação de estado no Flutter e criação de uma interface mais dinâmica e informativa.
 */