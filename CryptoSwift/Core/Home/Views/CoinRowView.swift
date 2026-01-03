//
//  CoinRowView.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 02/01/26.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}


extension CoinRowView {
    private var leftColumn: some View {
        HStack (spacing: 0) {
            Text("\(coin.rank)")
                .foregroundColor(Color.theme.secondaryText)
                .font(.caption)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 35, height: 35)
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .padding(.leading, 6)
        }
    }
    
    private var centerColumn: some View {
        VStack (alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
        
    }
    
    private var rightColumn: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00")
                    .foregroundColor(
                        coin.priceChangePercentage24H ?? 0 > 0 ?
                        Color.theme.greenColor : Color.theme.redColor
                    )
            }
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}

#Preview {
    CoinRowView(coin: dev.coin, showHoldingsColumn: true)
}


