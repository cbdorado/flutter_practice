import "package:flutter/material.dart";
import "./pages/product.dart";

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products) {
    print("[Products Widget] Constructor");
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/food.jpg"),
          Text(products[index]),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              child: Text("Details"),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(),
                    ),
                  ),
            )
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
