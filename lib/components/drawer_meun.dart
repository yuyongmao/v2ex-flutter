import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:v2ex/pages/about_page.dart';
import 'package:v2ex/pages/nodes_page.dart';
import 'package:v2ex/pages/profile_page.dart';
import 'package:v2ex/pages/remind_page.dart';
import 'package:v2ex/pages/favorite_page.dart';

class DrawerMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  new Drawer(
      child: new Column(
        children: <Widget>[
          new DrawerHeader(
            decoration:
            new BoxDecoration(color: Theme.of(context).primaryColor),
            child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Image.asset('images/account_bg.jpg',
                    fit: BoxFit.fill, height: 400.0, width: 600.0),
                new BackdropFilter(
                  filter:
                  new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: new Container(
                    color: Colors.black.withOpacity(0.5),
                    //child:
                  ),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                        padding: const EdgeInsets.only(top: 20.0)),
                    const CircleAvatar(
                      backgroundImage: const NetworkImage(
                          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1125401688,1369076827&fm=27&gp=0.jpg'),
                      radius: 32.0,
                    )
                  ],
                ),
              ],
            ),
            margin: new EdgeInsets.all(0.0),
            padding: new EdgeInsets.all(0.0),
          ),
          new ListTile(
            leading: new Icon(Icons.cached),
            title: new Text('最新'),
            onTap: () {
              Navigator.pop(context); // close the drawer
            },
          ),
          new ListTile(
            leading: new Icon(Icons.adjust),
            title: new Text('节点'),
            onTap: () {
              Navigator.pop(context); // close the drawer
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new NodesPage()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.favorite),
            title: new Text('收藏'),
            onTap: () {
              Navigator.pop(context); // close the drawer
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new FavoritePage()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.access_alarm),
            title: new Text('提醒'),
            onTap: () {
              Navigator.pop(context); // close the drawer
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new RemindPage()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.account_circle),
            title: new Text('个人'),
            onTap: () {
              Navigator.pop(context); // close the drawer
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProfilePage()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.info),
            title: new Text('关于'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new AboutPage()));
            },
          )
        ],
      ),
    );
  }
}