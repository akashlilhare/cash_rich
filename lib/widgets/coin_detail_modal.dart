import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/coin_model.dart';

class CoinDetailModal extends StatelessWidget {
  final CoinData coinData;

  const CoinDetailModal({Key? key, required this.coinData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getFormattedDate({required String date}) {
      final DateFormat formatter = DateFormat.yMMMMEEEEd();
      String formatted = formatter.format(DateTime.parse(date));
      return formatted;
    }

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 18,
          ),
          Center(
              child: Text(
            coinData.data.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 6),
            child: Text(
              "Tags",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...coinData.data.tags
                    .map((tag) => Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 12),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.2)),
                          child: Text(tag),
                        ))
                    .toList()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 6, top: 24),
            child: Text(
              "Price Last Updated",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              getFormattedDate(date: coinData.data.lastUpdated),
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    minimumSize: Size(double.infinity, 45)),
                child: Text(
                  "CLOSE",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
