import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/managers/latest_currency_manager.dart';
import 'package:flutter_project2/models/currency.dart';

import '../views/currency_view.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);
  static const routeName = "currencyScreen";

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<CurrencyScreen> {
  List<Currency> currency_list = parseCurrency(dummyResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "Currency",
            style: TextStyle(
              fontSize: 35,
              color: Colors.lime,
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: currency_list.length,
          itemBuilder: (context, index) {
            var item = currency_list[index];
            return CurrencyCellView(
              currencyDate: item.date,
              currencyBase: item.base,
              currencyRates: item.rates,
              currencyValue: item.value,


            );
          },
        ));
  }
}
