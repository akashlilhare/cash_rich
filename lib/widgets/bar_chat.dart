import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/coin_model.dart';
import '../model/coin_price_model.dart';

class CoinPriceChart extends StatefulWidget {
  final CoinModel data;

  const CoinPriceChart({Key? key, required this.data}) : super(key: key);

  @override
  State<CoinPriceChart> createState() => _CoinPriceChartState();
}

class _CoinPriceChartState extends State<CoinPriceChart> {
  late List<CoinChatModel> data = [];



  int maxRange = 1;
  @override
  void initState() {


    for (CoinData coin in widget.data.coinDataList) {
      maxRange = max(coin.data.quote.price.toInt(), maxRange);
      data.add(CoinChatModel(coin.name, coin.data.quote.price));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: maxRange + 100, interval: (maxRange + 100) /10),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<CoinChatModel, String>>[
          ColumnSeries<CoinChatModel, String>(
              dataSource: data,

              xValueMapper: (CoinChatModel data, _) => data.coinName,
              yValueMapper: (CoinChatModel data, _) => data.price,

              color: Theme.of(context).primaryColor)
        ])));
  }
}
