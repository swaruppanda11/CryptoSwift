//
//  ContentView.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 30/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Text("Hello World")
                    .foregroundColor(Color.theme.accent)
                Text("I am new to SwiftUI")
                    .foregroundColor(Color.theme.greenColor)
                    
            }
        }
    }
}

#Preview {
    ContentView()
}
