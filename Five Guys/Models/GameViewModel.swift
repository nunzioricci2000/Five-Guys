//
//  GameViewModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 28/10/22.
//

import Foundation

extension GameView {
    @MainActor class ViewModel: ObservableObject {
        @Published var level: LevelInfo
        
        init(level: LevelInfo) {
            self.level = level
        }
        
        func next() {
            level = level.next
        }
    }
}
