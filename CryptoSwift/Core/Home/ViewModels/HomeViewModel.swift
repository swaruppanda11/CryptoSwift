//
//  HomeViewModel.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 02/01/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(dev.coin)
            self.portfolioCoins.append(dev.coin)
        }
    }
}
