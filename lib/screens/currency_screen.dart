import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project2/managers/latest_currency_manager.dart';
import 'package:flutter_project2/models/currency.dart';
import 'package:flutter/services.dart' as rootBundle;
import '../views/currency_view.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);
  static const routeName = "currencyScreen";

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<CurrencyScreen> {
//  List<Currency> currency_list = parseCurrency(dummyResponse);

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
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<Currency>;
              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: // vezi minutu 16:53 din video
                        )
                      ],
                    ),
                  ),
                );
              });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
        /*ListView.builder(
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
        )*/
        );
  }

  Future<List<Currency>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('jsonfile/latest_currency.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Currency.fromJson(e)).toList();
  }
}
