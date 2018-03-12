import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'V2EX'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Hello to V2EX',
            ),
          ],
        ),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text('V2EXER'),
              accountEmail: const Text('v2exer@v2ex.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage:const NetworkImage('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=962905290,1771717332&fm=27&gp=0.jpg'),
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.change_history),
              title: new Text('Change history'),
              onTap: () {
                Navigator.pop(context); // close the drawer
              },
            )
          ],
        ),
      ),
    );
  }
}
