import "package:flutter/material.dart";
import "dart:async";
import '../widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped-models/main.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;
  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("This action cannot be undone!"),
              actions: <Widget>[
                FlatButton(
                    child: Text('Discard'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                FlatButton(
                    child: Text('Continue'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                    }),
              ]);
        });
  }

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          child: Text(
            '|',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          '\$${price.toString()}',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        print('back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          final Product product = model.getProducts[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(product.image),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TitleDefault(product.title),
                  ),
                  _buildAddressPriceRow(product.price),
                  Container(
                    // padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
