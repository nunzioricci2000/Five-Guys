//
//  MenuButtonTextHiddenModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import Foundation

extension MenuButtonTextHidden {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var title: String
        @Published var subtitle: String
        @Published var pressed: Bool
        
        init(_ title: String, subtitle: String = "", pressed: Bool = false) {
            self.pressed = pressed
            self.title = title
            self.subtitle = subtitle
        }
    }
}
