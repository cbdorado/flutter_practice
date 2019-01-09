import "package:flutter/material.dart";

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget widget;
    widget = Column(children: <Widget>[
      TextField(onChanged: (String value) {
        setState(() {
          titleValue = value;
        });
      }),
      
    ]);
    return widget;
  }
}
