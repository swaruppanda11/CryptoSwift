//
//  CoinDataService.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 03/01/26.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    
    init() {
        Task {
            await getCoins()
        }
    }
    
    func getCoins() async {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
            
            let coins = try JSONDecoder().decode([CoinModel].self, from: data)
            
            await MainActor.run {
                self.allCoins = coins
            }
        } catch {
            print("Error fetching coins: \(error.localizedDescription)")
        }
    }
}
