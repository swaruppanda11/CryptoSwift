//
//  CircleButtonView.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 01/01/26.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .fill(Color.theme.backgroundColor)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10
            )
            .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(iconName: "info")
}
