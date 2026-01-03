//
//  CoinModel.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 01/01/26.
//

import Foundation

// CoinGecko API Info
/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response Sample:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 61408,
     "market_cap": 1141731099010,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1285385611303,
     "total_volume": 67190952980,
     "high_24h": 61712,
     "low_24h": 56220,
     "price_change_24h": 3952.64,
     "price_change_percentage_24h": 6.87944,
     "market_cap_change_24h": 72110681879,
     "market_cap_change_percentage_24h": 6.74171,
     "circulating_supply": 18653043,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 64805,
     "ath_change_percentage": -4.97589,
     "ath_date": "2021-04-14T11:54:46.763Z",
     "atl": 67.81,
     "atl_change_percentage": 90020.24075,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2021-03-13T23:18:10.268Z",
     "sparkline_in_7d": {
       "price": [54019.26878317463,53718.060935791524,53677.12968669343,…]
     },
     "price_change_percentage_24h_in_currency": 6.8794403445136
   }
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}
struct SparklineIn7D: Codable {
    let price: [Double]?
}

// MARK: - Sample Data for Previews
extension CoinModel {
    static var example: CoinModel {
        CoinModel(
            id: "bitcoin",
            symbol: "btc",
            name: "Bitcoin",
            image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png",
            currentPrice: 61408,
            marketCap: 1141731099010,
            marketCapRank: 1,
            fullyDilutedValuation: 1285385611303,
            totalVolume: 67190952980,
            high24H: 61712,
            low24H: 56220,
            priceChange24H: 3952.64,
            priceChangePercentage24H: 6.87944,
            marketCapChange24H: 72110681879,
            marketCapChangePercentage24H: 6.74171,
            circulatingSupply: 18653043,
            totalSupply: 21000000,
            maxSupply: 21000000,
            ath: 64805,
            athChangePercentage: -4.97589,
            athDate: "2021-04-14T11:54:46.763Z",
            atl: 67.81,
            atlChangePercentage: 90020.24075,
            atlDate: "2013-07-06T00:00:00.000Z",
            lastUpdated: "2021-03-13T23:18:10.268Z",
            sparklineIn7D: SparklineIn7D(price: [54019, 53718, 53677, 54200, 55000, 56000, 61408]),
            priceChangePercentage24HInCurrency: 6.8794403445136,
            currentHoldings: 1.5
        )
    }
}

