import 'package:flutter/material.dart';

enum Status {
  wait,
  ok,
}

extension FormExtensionStatus on Status {

  String get getName {
    switch (this) {
      case Status.ok:
        return "Ok";
      case Status.wait:
        return "Wait";
      default:
        return "Wait";
    }
  }

  Icon get getIcon {
    switch (this) {
      case Status.wait:
        return const Icon(Icons.add);
      case Status.ok:
        return const Icon(Icons.close);
      default:
        return const Icon(Icons.add);
    }
  }
}