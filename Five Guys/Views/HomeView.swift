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
    @StateObject var model = ViewModel()
    
    var body: some View {
        ZStack {
            Color
                .white
                .opacity(0)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Title("Five Tiles")
                        .padding(.bottom, 10)
                    Subtitle("\(model.currentLevel.num - 1) levels completed")
                    Subtitle("\(totalLevels + 1 - model.currentLevel.num) remained")
                }.offset(y:37)
                Spacer()
                Button {
                    withAnimation {
                        handler.page = .game
                    }
                } label: {
                    MenuButton("PLAY")
                }.padding(40)
                MenuButton("HISTORY").onTapGesture {
                        withAnimation {
                            handler.page = .history
                        }
                    }.padding(40)
                Spacer()
                InfoButton()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            HomeView()
        }
    }
}
