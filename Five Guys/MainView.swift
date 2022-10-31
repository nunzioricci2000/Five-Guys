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
            Foreground()
            ZStack {
                Background().zIndex(0)
                HStack {
                    switch handler.page {
                    case .home:
                        HomeView()
                            .transition(.move(edge: .leading).animation(.linear(duration: 2)))
                    case .game:
                        GameView()
                            .transition(.move(edge: .trailing).animation(.linear(duration: 2)))
                    case .history:
                        ScoreView()
                            .transition(.move(edge: .trailing).animation(.linear(duration: 2)))
                    }
                }.environmentObject(handler)
                    .zIndex(1)
                    .blendMode(.destinationOut)
            }.compositingGroup()
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
