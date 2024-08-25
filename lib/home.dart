
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){

    _itens = [];

    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo $i Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição $i Lorem ipsum dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice){
            //print("item ${_itens[indice].toString()}");
            return ListTile(
              onTap: (){
                showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        title: Text("${_itens[indice]["titulo"]}"),
                        titlePadding: const EdgeInsets.all(40),
                        titleTextStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                        ),
                        backgroundColor: Colors.blue,
                        content: Text("${_itens[indice]["descricao"]}"),
                        actions: [
                          ElevatedButton(
                            onPressed: (){
                              print("sim");
                              Navigator.pop(context);
                            },
                            child: const Text("sim"),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              print("não");
                              Navigator.pop(context);
                            },
                            child: const Text("não"),
                          ),
                        ],

                      );
                    },
                );
              },
              title: Text( _itens[indice]["titulo"].toString()),
              subtitle: Text(_itens[indice]["descricao"].toString()),
            );
          },
        ),
      ),
    );
  }
}
