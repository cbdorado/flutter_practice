import "package:flutter/material.dart";
import "../pages/product.dart";

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print("[Products Widget] Constructor");
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(products[index]['title'],
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        '\$${products[index]['price'].toString()}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ])),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              'Union Square, San Francisco',
            ),
          ),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()))
          ])
        ],
      ),
    );
  }

  Widget _buildProductLists() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print("[Products Widget] build");
    // use .builder when generating lists for better performance

    return _buildProductLists();
  }
}
