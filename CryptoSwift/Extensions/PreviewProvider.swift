//
//  PreviewProvider.swift
//  CryptoSwift
//
//  Created by Swarup Panda on 02/01/26.
//

import Foundation
import SwiftUI

// Global dev instance for use with #Preview macro
let dev = DeveloperPreview.instance

extension PreviewProvider {
    // Keep this for backward compatibility with old PreviewProvider style
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let coin = CoinModel.example
}
