//
//  GameView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var handler: PageHandler
    @StateObject var model = ViewModel(level: Memory.handler.current)
    
    var body: some View {
        ZStack {
            Color
                .white
                .opacity(0)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Subtitle("GAME")
                    HStack {
                        BackIcon()
                            .onTapGesture {
                                withAnimation {
                                    handler.page = .home
                                }
                            }
                        Spacer()
                    }
                }
                Spacer()
                FiveTilesView(game: FiveTiles(model.level.num)).transition(.slide)
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            GameView()
        }
    }
}
