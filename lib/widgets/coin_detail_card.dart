import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/coin_model.dart';
import 'coin_detail_modal.dart';

class CoinDetailCard extends StatelessWidget {
  final CoinData coinData;

  const CoinDetailCard({Key? key, required this.coinData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (context) {
              return CoinDetailModal(coinData: coinData,);
            });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coinData.data.name,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Price: \$" + coinData.data.quote.price.toStringAsFixed(2),
                  style: TextStyle(color: Colors.white70),
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    coinData.data.quote.volumeChange_24h.isNegative?   Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                    ): Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    ),
                    Text(
                      coinData.data.quote.volumeChange_24h.toStringAsFixed(2)+
                      "%",
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Rank ${coinData.data.cmcRank}",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    coinData.data.symbol,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
