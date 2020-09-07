import 'dart:ui';

import 'package:coriander/next_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//【レス】アプリ全体＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

      // -----
      // //画面遷移は、navigate.push/popか、下記のように送り先をルートで指定
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => MyHomePage(), // -- initial root
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/next': (context) => NextPage(), // -- otherPage root
      // },
      // ------
    );
  }
}

//【フル＿ウィジェット＿ビュー】ーーーーーーーーーーーーー
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//【フル＿ステート＿コントローラー】ーーーーーーーーーーーーー
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  // 画面遷移からの戻りときのコメント用変数定義
  String text = "NEXT page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // appBarヘッダー
        // title: Text(widget.title),
        title: Text("Strength Rec"), // テキストwidget
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.share),
          Icon(Icons.login),
          Icon(Icons.logout),
          Icon(Icons.home),
        ], // ヘッダーにアイコンのせる簡単
      ),
      body: Center(
        child: Column(
          // 画像を真ん中寄せにしようと
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Text(
              "ネイマール",
              // textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,

              ),
            ),
            Text("メッシ"),

            Image.asset("assets/images/drivingLover.jpg", width: 200, height: 300,),
            // netowork春だけ
            // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', width: 200, height: 300,),
            Icon(
              Icons.print,
              size: 80,
              color: Colors.orange,
            ),
            RaisedButton( // RaisedButton一旦削除
              child: Text("text"),
              onPressed: () async {
                // 画面遷移はnavigater
                // Navigator.pushにresultつけると、画面遷移してpop()戻ってくる際に、resultに値が入る
                // 時間かかる処理ゆえasync-await追加
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage("Abe"),
                    ),
                );
                text =result;
                print(result);
                // ルーティングに変更
                // Navigator.pushNamed(context, '/next');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
