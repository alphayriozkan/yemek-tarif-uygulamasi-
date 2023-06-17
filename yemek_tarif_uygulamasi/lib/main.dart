import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Yemek Tarifi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    var ekranBilgisi=MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    final double ekranYuksekligi = ekranBilgisi.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: ekranGenisligi,
                child: Image.asset("resimler/yemekresmi.jpg")
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: ElevatedButton(
                      child: Yazi("Beğen", ekranGenisligi/25),
                      onPressed: (){
                        print("Beğenildi");
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: ElevatedButton(
                      child: Yazi("Yorum Yap", ekranGenisligi/25),
                      onPressed: (){
                        print("Yorum yapıldı");
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(ekranGenisligi/25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Köfte",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi/20

                  ),
                  ),
                  Row(
                    children: [
                      Yazi("Izgara üzerinde pişirime uygun", ekranGenisligi/25),
                      Spacer(),
                      Yazi("27 Mayıs", ekranGenisligi/25)
                    ],
                  )
                ],
              ),
            ),
            Text("Köfte, genellikle kızartma, ızgara veya fırında pişirilerek servis edilir."
                " Üzerine yoğurt, domates sosu veya zeytinyağı gibi çeşitli soslar eklenerek sunulan köfteler,"
                " pilav, pide, ekmek veya salata gibi yanında servis edilen çeşitli garnitürlerle tamamlanır",
              style: TextStyle(
                fontSize: ekranGenisligi/25
              ),

            )

          ],
        ),
      )

    );
  }
}

class Yazi extends StatelessWidget {
  String icerik;
  double yaziBoyut;

  Yazi(this.icerik, this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(icerik,style: TextStyle(fontSize: yaziBoyut),);
  }
}

