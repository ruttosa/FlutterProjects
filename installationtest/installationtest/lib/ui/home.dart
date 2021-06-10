import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrange,
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            /* width: 192.0, */
            /* height: 96.0, */
            /* margin: EdgeInsets.only(left: 50.0), */
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Margarita",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 30.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'ZenDots')),
                  ),
                  Expanded(
                      child: Text("Tomato, Mozzarella, Basil",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'ZenDots')))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Marinara",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 30.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'ZenDots')),
                  ),
                  Expanded(
                      child: Text("Tomato, Garlic",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 20.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'ZenDots')))
                ],
              ),
              PizzaImageWidget(),
              OrderButton()
            ])));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza.png');
    Image image = Image(image: pizzaAsset, width: 400.0, height: 400.0);
    return Container(child: image);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: TextButton(
        child: Text("Order your pizza", style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent)),
        onPressed: () {
          order(context);
        },
      ),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
        title: Text("Order completed!"),
        content: Text("Thanks for your order"));
    showDialog(context: context, builder: (buildContext) => alert);
  }
}
