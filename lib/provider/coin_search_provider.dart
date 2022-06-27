import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/coin_model.dart';
import '../pages/search_result_page.dart';

class CoinSearchProvider with ChangeNotifier {
  TextEditingController coinNameController = TextEditingController();
  CoinModel? coinData;
  bool isLoading = false;

  searchCoin({required BuildContext context}) async {
    try {
      String baseUrl =
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=";
      isLoading = true;
      notifyListeners();

      http.Response response = await http.get(
          Uri.parse(baseUrl + coinNameController.text.toUpperCase()),
          headers: {
            "X-CMC_PRO_API_KEY": "27ab17d1-215f-49e5-9ca4-afd48810c149"
          });

      if (response.statusCode == 200) {
        log(response.body);
        var jsonData = json.decode(response.body);
        coinData = CoinModel.fromJson(jsonData);
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>SearchResultPage()));
      } else {
        throw "something went wrong";
      }
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}
