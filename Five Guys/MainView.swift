//
//  MainView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 19/10/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var handler: PageHandler = PageHandler()
    
    var body: some View {
        ZStack {
            Background()
            HStack {
                switch handler.page {
                case .home:
                    HomeView()
                        .transition(.move(edge: .leading))
                case .game:
                    GameView()
                        .transition(.move(edge: .trailing))
                case .history:
                    ScoreView()
                        .transition(.move(edge: .trailing))
                }
            }.environmentObject(handler)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MainView()
        }
    }
}
