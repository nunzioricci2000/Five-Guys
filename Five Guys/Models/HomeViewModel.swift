//
//  HomeViewModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 28/10/22.
//

import Foundation

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var currentLevel: LevelInfo = LevelInfo.current
    }
}
