//
//  MainView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 19/10/22.
//

import SwiftUI

enum Page {
    case start, home, games
    case level(Level)
}

struct MainView: View {
    
    @State var currentPage: Page = .start
    
    var body: some View {
        return ZStack {
            Color.gray.ignoresSafeArea()
            Group {
                switch currentPage {
                case .start: StartView(page: $currentPage)
                case .home: HomeView(currentPage: $currentPage)
                case .games: GamesView(currentPage: $currentPage)
                case .level(let id):
                    LevelHandlerView(id: id)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
