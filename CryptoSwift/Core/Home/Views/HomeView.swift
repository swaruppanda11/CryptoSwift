//
//  HomeView.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 01/01/26.
//

import SwiftUI


struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            // content layer
            VStack {
                header
                
                Spacer(minLength: 0)
            }
        }
    }
    
    private var header: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .foregroundStyle(Color.theme.accent)
                .font(.headline)
                .fontWeight(.heavy)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180.0 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
