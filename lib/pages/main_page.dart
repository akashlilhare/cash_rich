import 'package:cash_rich/provider/coin_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CoinSearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("CoinRich"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: provider.coinNameController,
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "Enter Coin Symbol",
                  hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(.6)),
                  filled: true,
                  fillColor: Theme.of(context).appBarTheme.backgroundColor,
                  prefixIconColor: Theme.of(context).primaryColor,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor.withOpacity(.6),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                provider.searchCoin(context: context);
              },
              child: provider.isLoading?Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 3,
                ),
              ): Text(
                "SEARCH",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, 45)),
            )
          ],
        ),
      ),
    );
  }
}
