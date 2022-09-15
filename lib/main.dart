import 'package:doviz_app/api.dart';
import 'package:doviz_app/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Döviz Uygulaması ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Güncel Kurlar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CryptoApi api = CryptoApi();
  List<Currency> doviz = [];
  void initState() {
    // TODO: implement initState
    super.initState();

    CryptoApi.getCoins().then((value) async {
      if(value != null){
        setState(() {
          doviz = value.toList();

        });
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: doviz.length,
        itemBuilder: (context,indeks){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 75,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doviz[indeks].name.toString()),
                        Row(children: [
                          Row(
                            children: [
                              Text("Alış: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("${doviz[indeks].buying.toString()}") ,
                            ],
                          ),
                        ],),
                        Row(children: [
                          Row(
                            children: [
                              Text("Satış: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("${doviz[indeks].selling.toString()}"),
                            ],
                          ),
                        ],),

                      ],),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
