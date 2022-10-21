//
//  ContentView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 18/10/22.
//

import SwiftUI

struct StartView: View {
    enum Page {
        case games, points, trophy
    }
    @State var current = Page.games
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            TabView(selection: $current) {
                ZStack {
                    Image("maze")
                    VStack(alignment: .leading) {
                        Text("GAMES")
                            .font(.title)
                        Text("In each level you will face a different game. Every time you complete a level you will get 20 points")
                            .font(.body)
                    }.frame(width: 300)
                }.onTapGesture {
                    current = .points
                }.tag(Page.games)
                ZStack {
                    Image("stars")
                    VStack(alignment: .leading) {
                        Text("POINTS").font(.title)
                        Text("You can use the points you collected")
                            .font(.title)
                    }
                        .frame(width: 300)
                }.onTapGesture {
                    current = .trophy
                }.tag(Page.points)
                ZStack {
                    Image("podium")
                    VStack(alignment: .leading) {
                        Text("TROPHY").font(.title)
                        Text("you can use the points you collected to unlock avatars and characters")
                            .font(.title)
                    }
                        .frame(width: 300)
                }.onTapGesture {
                    
                }.tag(Page.trophy)
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
