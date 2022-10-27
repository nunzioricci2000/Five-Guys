//
//  MainView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 19/10/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var handler: PageHandler = PageHandler()
    
    var body: some View {
        HStack {
            switch handler.page {
            case .home:
                HomeView()
                    .transition(.move(edge: .leading))
            case .game(let level):
                GameView(level: level)
                    .transition(.move(edge: .trailing))
            case .history:
                HistoryView()
                    .transition(.move(edge: .trailing))
            }
        }.environmentObject(handler)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MainView()
        }
    }
}
