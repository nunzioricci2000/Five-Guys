//
//  MainView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 19/10/22.
//

import SwiftUI



struct MainView: View {
    @StateObject var mainvm = ViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Group {
                switch mainvm.page {
                case .onboard: OnboardView()
                case .home: HomeView()
                case .games: GamesView()
                case .level(let id):
                    LevelHandlerView(id: id)
                }
            }.environmentObject(mainvm)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
