import 'package:pharmacyapp/component/items.dart';

class CartBrain {
  List<MyItem> CartList = [
    MyItem(
      itemName: "mohamed",
      itemPrice: 50,
    ),
  ];

  void AddCart(MyItem a) {
    CartList.add(a);
  }

  List<MyItem> GetCart() {
    return CartList;
  }

  int lenCart() {
    return CartList.length - 1;
  }
}
