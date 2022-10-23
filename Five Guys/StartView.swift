//
//  ContentView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 18/10/22.
//

import SwiftUI

struct StartView: View {
    enum Slide {
        case games, points, trophy
    }
    
    @State var current = Slide.games
    @Binding var page: Page
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
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
                }.tag(Slide.games)
                ZStack {
                    Image("stars")
                    VStack(alignment: .leading) {
                        Text("POINTS").font(.title)
                        Text("You can use the points you collected")
                            .font(.body)
                    }
                        .frame(width: 300)
                }.onTapGesture {
                    current = .trophy
                }.tag(Slide.points)
                ZStack {
                    Image("podium")
                    VStack(alignment: .leading) {
                        Text("TROPHY").font(.title)
                        Text("you can use the points you collected to unlock avatars and characters")
                            .font(.body)
                    }
                        .frame(width: 300)
                }.onTapGesture {
                    page = .home
                }.tag(Slide.trophy)
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    @State static var currentPage: Page = .start
    static var previews: some View {
        StartView(page: $currentPage)
    }
}
