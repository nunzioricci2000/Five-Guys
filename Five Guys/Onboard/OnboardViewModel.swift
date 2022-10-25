//
//  OnboardViewModel.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 25/10/22.
//

import SwiftUI

extension OnboardView {
    enum Slide {
        case games, points, trophy
    }
    
    @MainActor class ViewModel: ObservableObject {
        @Published var slide: Slide = .games
        
        init() {
            slide = .games
        }
        
        func setSlide(_ slide: Slide) {
            self.slide = slide
        }
    }
}
