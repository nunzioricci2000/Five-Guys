//
//  HapticFlip.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import SwiftUI

class HapticFlip {
    
    static var instance = HapticFlip()
    private init() {}
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
