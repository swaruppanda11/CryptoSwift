//
//  CryptoSwiftApp.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 30/12/25.
//

import SwiftUI

@main
struct CryptoSwiftApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
