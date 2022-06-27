import 'package:cash_rich/widgets/coin_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/coin_search_provider.dart';
import '../widgets/bar_chat.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  bool showChart = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CoinSearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("CoinRich"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  showChart = !showChart;
                });
              },
              child: Row(
                children: [
                  Icon(showChart
                      ? Icons.list_outlined
                      : Icons.pie_chart_outline),
                  SizedBox(
                    width: 8,
                  ),
                  Text(showChart ? "Show List" : "Show Chart")
                ],
              ),
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
            Spacer(),
            Text(
              "Count: ${provider.coinData!.coinDataList.length.toString()}",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
        showChart
            ? CoinPriceChart(data: provider.coinData!)
            : Column(
                children: provider.coinData!.coinDataList
                    .map((coinData) => CoinDetailCard(
                          coinData: coinData,
                        ))
                    .toList()),
      ])),
    );
  }
}
