import 'package:flutter/material.dart';

class TabData {
  TabData({this.subWidget, this.codeTag, this.description, this.tabName});

  final Widget subWidget;
  final String codeTag;
  final String description;
  final String tabName;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;

    final TabData typedOther = other;
    return typedOther.tabName == tabName &&
        typedOther.description == description;
  }

  @override
  int get hashCode => hashValues(tabName.hashCode, description.hashCode);
}

