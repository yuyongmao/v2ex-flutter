import 'package:flutter/material.dart';
import 'package:v2ex/models/node_item.dart';
import 'package:v2ex/util/api.dart';
import 'dart:async';

class NodesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NodePageState();
  }
}

class _NodePageState extends State<NodesPage> {
  List<NodeGroup> nodeGroups = <NodeGroup>[];

  @override
  void initState() {
    super.initState();
    getAllNodes();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: const Text('节点导航')),
        body: new Center(
          child: new ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: nodeGroups.length,
          ),
        ));
  }

  Future getAllNodes() async {
    List<NodeGroup> tmpGroups = await v2exApi.getNodes();
    if (mounted) {
      this.setState(() {
        nodeGroups.clear();
        nodeGroups.addAll(tmpGroups);
      });
    }
  }

  Widget itemBuilder(BuildContext context, int index) {
    return new NodeGroupWidget(nodeGroups[index],context);
  }
}

class NodeGroupWidget extends StatelessWidget {
  final NodeGroup nodeGroup;
  final BuildContext context;

  NodeGroupWidget(this.nodeGroup,this.context);

  @override
  Widget build(BuildContext context) {
    Container _container = new Container(
      padding: const EdgeInsets.all(5.0),
      child: new Column(
        children: <Widget>[
          new Text(nodeGroup.nodeGroupName,style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          new Padding(padding: const EdgeInsets.only(bottom: 10.0)),
          new Wrap(
            children:
                nodeGroup.nodes.map((node) => renderNode(node)).toList(),
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: 6.0,
            runSpacing: 5.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            textDirection: TextDirection.ltr,
          ),
          new Padding(padding: const EdgeInsets.only(bottom: 5.0)),
        ],
      ),
    );

    return new Card(child: _container, color: Colors.white);
  }

  Widget renderNode(NodeItem node) {
    return new InkWell(
      child: new Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8.0),
        child: new Text(node.nodeName,style: new TextStyle(color: Theme.of(context).primaryColor,fontSize: 13.0),),
        decoration:new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.white
        ),
      ),
      onTap: ()=>print(node.nodeId),
    );
  }
}
