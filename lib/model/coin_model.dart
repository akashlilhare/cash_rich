import 'dart:developer';

class CoinModel {
  CoinModel({
    required this.status,
    required this.coinDataList,
  });

  late final Status status;

  late final List<CoinData> coinDataList;


  CoinModel.fromJson(Map<String, dynamic> json) {
    status = Status.fromJson(json['status']);
    List<CoinData> list = [];
    Map<String, dynamic> jsonData = json["data"];
    jsonData.forEach((key, value) {
      String name = key;
      Data data = Data.fromJson(value);
      list.add(CoinData(data: data, name: name));
    });
    coinDataList = list;
  }
}


class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    this.notice,
  });

  late final String timestamp;
  late final int errorCode;
  late String? errorMessage;
  late final int elapsed;
  late final int creditCount;
  late String? notice;

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = null;
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = null;
  }
}

class CoinData{
  final Data data;
  final String name;
  CoinData({required this.data, required this.name});
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.isActive,
    required this.cmcRank,
    required this.isFiat,
    required this.lastUpdated,
    required this.quote,
  });

  late final int id;
  late final String name;
  late final String symbol;
  late final String slug;
  late final int numMarketPairs;
  late final String dateAdded;
  late final List<String> tags;
  late final int? maxSupply;
  late final num? circulatingSupply;
  late final num? totalSupply;
  late final int? isActive;
  late final int cmcRank;
  late final int? isFiat;
  late final String lastUpdated;
  late final Quote quote;

  Data.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];

    tags = List.castFrom<dynamic, String>(json['tags']);

    maxSupply = json['max_supply'];

    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    isActive = json['is_active'];
    cmcRank = json['cmc_rank'];
    isFiat = json['is_fiat'];
    lastUpdated = json['last_updated'];

    quote =Quote.fromJson( json['quote']['USD']);
  }
}

class Quote{
  Quote({
    required this.price,
    required this.volume_24h,
    required this.volumeChange_24h,
    required this.percentChange_1h,
    required this.percentChange_24h,
    required this.percentChange_7d,
    required this.percentChange_30d,
    required this.percentChange_60d,
    required this.percentChange_90d,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.lastUpdated,
  });
  late final double price;
  late final num volume_24h;
  late final num volumeChange_24h;
  late final num percentChange_1h;
  late final num percentChange_24h;
  late final num percentChange_7d;
  late final num percentChange_30d;
  late final num percentChange_60d;
  late final num percentChange_90d;
  late final num marketCap;
  late final num marketCapDominance;
  late final num fullyDilutedMarketCap;
  late final String lastUpdated;

  Quote.fromJson(Map<String, dynamic> json){

    price = json['price'];
    volume_24h = json['volume_24h'];
    volumeChange_24h = json['volume_change_24h'];
    percentChange_1h = json['percent_change_1h'];
    percentChange_24h = json['percent_change_24h'];
    percentChange_7d = json['percent_change_7d'];
    percentChange_30d = json['percent_change_30d'];
    percentChange_60d = json['percent_change_60d'];
    percentChange_90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }
}