//
//  MenuButtonRectModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import Foundation

extension MenuButtonRect {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var pressed: Bool
        
        init(pressed: Bool = false) {
            self.pressed = pressed
        }
    }
}
