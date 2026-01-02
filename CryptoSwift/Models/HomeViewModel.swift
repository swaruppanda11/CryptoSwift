//
//  HomeViewModel.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 01/01/26.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let coinDataService = CoinDataService.shared
    
    init() {
        Task {
            await loadCoins()
        }
    }
    
    func loadCoins() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let coins = try await coinDataService.fetchCoins()
            self.allCoins = coins
            isLoading = false
        } catch {
            errorMessage = "Failed to load coins: \(error.localizedDescription)"
            isLoading = false
            print("Error loading coins: \(error)")
        }
    }
    
    func refreshCoins() async {
        await loadCoins()
    }
}
