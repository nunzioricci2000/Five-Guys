//
//  GameView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var handler: PageHandler
    let level: Int
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
                FiveTilesView(game: FiveTiles(level))
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: 1)
    }
}
