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
    
    private let dataService = CoinDataService()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        Task {
            addSubscribers()
        }
    }
    
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins: [CoinModel]) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
    }
}
