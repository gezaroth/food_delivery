import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "A juicy beef patty with melted cheddar, lettuce and a hint of onion and pickle",
      imagePath: 'lib/images/burgers/cheese_burger.jpg',
      price: 10.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description: "Smoky BBQ sauce, crispy bacon",
      imagePath: 'lib/images/burgers/bbq_burger.jpg',
      price: 11.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: 'Extra onion', price: 0.99),
        Addon(name: 'egg', price: 0.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: "Aloha Cheeseburger",
      description: "Pineapple burger",
      imagePath: 'lib/images/burgers/aloha_burger.jpg',
      price: 12.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: 'Extra pineapple', price: 0.99),
        Addon(name: 'beef patty', price: 2.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: "Veggie",
      description: "Falaffel burger",
      imagePath: 'lib/images/burgers/veggie_burger.jpg',
      price: 0.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: 'Extra lettuce', price: 0.99),
      ],
    ),
    Food(
      name: "Bluemoon",
      description: "Blue cheese burger",
      imagePath: 'lib/images/burgers/cheese_burger.jpg',
      price: 0.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),
    // salads
    Food(
      name: "Asian sesame salad",
      description: "A  asian salad with sesame seeds",
      imagePath: 'lib/images/salads/asiansesame_salad.jpg',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),
    Food(
      name: "Cesar salad",
      description: "cesar salad",
      imagePath: 'lib/images/salads/cesar_salad.jpg',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra sesame', price: 0.99),
        Addon(name: 'soy ranch sauce', price: 0.99),
        Addon(name: 'chicken', price: 1.99),
      ],
    ),
    Food(
      name: "greek salad",
      description: "A  asian salad with sesame seeds",
      imagePath: 'lib/images/salads/greek_salad.jpg',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra fetta cheese', price: 1.99),
      ],
    ),
    Food(
      name: "quinoa salad",
      description: "A  asian salad with sesame seeds",
      imagePath: 'lib/images/salads/quinoa_salad.jpg',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Extra quinoa', price: 0.99),
      ],
    ),
    Food(
      name: "southwest salad",
      description: "A  asian salad with sesame seeds",
      imagePath: 'lib/images/salads/southwest_salad.jpg',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),
    // sides
    Food(
      name: "garlic bread",
      description: "garlic bread",
      imagePath: 'lib/images/sides/garlic_bread_side.jpg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "loaded fries",
      description: "fries with cheese and bacon",
      imagePath: 'lib/images/sides/loadedfries_side.jpeg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "mac and cheese",
      description: "macaroni with cheese",
      imagePath: 'lib/images/sides/mac_side.jpg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "onion rings",
      description: "onion with dogh fried",
      imagePath: 'lib/images/sides/onion_rings_side.jpg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: "sweet potatoes",
      description: "potatoes sweet",
      imagePath: 'lib/images/sides/sweet_potato_side.jpg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    // desserts
    Food(
      name: "apple pie",
      description: "pie the apple",
      imagePath: 'lib/images/desserts/apple_pie_dessert.jpg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    Food(
      name: "croissant",
      description: "fresh mand croisssant",
      imagePath: 'lib/images/desserts/croissant_dessert.jpeg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    Food(
      name: "vanilla ice cream",
      description: "ice creamwoth vanilla flower",
      imagePath: 'lib/images/desserts/icecream_dessert.jpg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    Food(
      name: "lottus pie",
      description: "pie made with lottus cream",
      imagePath: 'lib/images/desserts/lottuspie_dessert.jpg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    Food(
      name: "pear pie",
      description: "pie made with pears",
      imagePath: 'lib/images/desserts/pearpie_dessert.jpg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),
    // drinks
    Food(
      name: "caramel drink",
      description: "milkshake with caramel",
      imagePath: 'lib/images/drinks/caramel_drink.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra almond milk', price: 0.99),
      ],
    ),
    Food(
      name: "ice tea",
      description: "iced teaaaa",
      imagePath: 'lib/images/drinks/ice_tea_drink.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra lime', price: 0.99),
      ],
    ),
    Food(
      name: "lemonade",
      description: "fresh lemonade",
      imagePath: 'lib/images/drinks/lemonade_drink.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra sugar', price: 0.99),
      ],
    ),
    Food(
      name: "mojito",
      description: "milkshake with caramel",
      imagePath: 'lib/images/drinks/mojito_drink.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra rum', price: 3.99),
      ],
    ),
    Food(
      name: "smoothie",
      description: "stawberry smoothie",
      imagePath: 'lib/images/drinks/caramel_drink.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra almond milk', price: 0.99),
        Addon(name: 'Extra strawberry', price: 0.99),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivery address (user can manage/update/change)
  String _deliveryAddress = '99 Hollywood Blv';

  // GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  OPERATIONS

  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of the cart

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get toal items of the cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

  HELPERS

  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    String formattedDate = DateFormat('yyy-MM-HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
          "     Add-ons: ${_formatAddons(cartItem.selectedAddons)}",
        );
      }
      receipt.writeln();
    }
    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
