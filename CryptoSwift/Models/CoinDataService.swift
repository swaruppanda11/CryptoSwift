//
//  CoinDataService.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 01/01/26.
//

import Foundation

class CoinDataService {
    
    static let shared = CoinDataService()
    
    private init() {}
    
    private let baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    
    func fetchCoins() async throws -> [CoinModel] {
        // Build URL with query parameters
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_desc"),
            URLQueryItem(name: "per_page", value: "250"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "true"),
            URLQueryItem(name: "price_change_percentage", value: "24h")
        ]
        
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        // Fetch data using async/await
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check response status
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // Decode JSON
        let decoder = JSONDecoder()
        let coins = try decoder.decode([CoinModel].self, from: data)
        
        return coins
    }
}
