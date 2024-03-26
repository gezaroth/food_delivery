import 'package:flutter/material.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$0.99',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Delivery Fee',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '15-30 min',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Delivery Time',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
