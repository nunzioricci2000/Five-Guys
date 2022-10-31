//
//  HomeView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

let totalLevels: Int = 2 ^^ 25 - 1

struct HomeView: View {
    @EnvironmentObject var handler: PageHandler
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        ZStack {
            Color
                .white
                .opacity(0)
                .ignoresSafeArea()
            VStack {
                Title("Flippy Tiles")
                    .padding(.bottom, 100)
                    .offset(y:37)
                Spacer()
                MenuButton("PLAY", subtitle: "Level: \(model.currentLevel)")
                {
                    withAnimation {
                        handler.page = .game
                    }
                }.padding()
                MenuButton("SCORE") {
                    withAnimation {
                        handler.page = .history
                    }
                }.padding()
                Spacer()
                Spacer()
                InfoButton()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            HomeView()
        }
    }
}
