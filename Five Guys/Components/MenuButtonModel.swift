//
//  MenuButtonModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import Foundation

extension MenuButton {
    @MainActor
    class ViewModel: ObservableObject {
        @Published var title: String = ""
        @Published var subtitle: String = ""
        @Published var pressed: Bool = false
        @Published var onTap: ()->() = {}
    }
}
