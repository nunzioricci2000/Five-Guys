//
//  MainViewModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 25/10/22.
//

import SwiftUI

extension MainView {
    enum Page {
        case onboard, home, games
        case level(Level)
    }
    
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var page: Page
        
        init() {
            page = .onboard
        }
        func setPage(_ page: Page) {
            self.page = page
        }
    }
}
