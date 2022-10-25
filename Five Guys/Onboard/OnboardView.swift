//
//  ContentView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 18/10/22.
//

import SwiftUI

struct OnboardView: View {
    @EnvironmentObject var mainvm: MainView.ViewModel
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.slide) {
                ZStack {
                    Image("maze")
                    VStack(alignment: .leading) {
                        Text("GAMES")
                            .font(.title)
                        Text("In each level you will face a different game. Every time you complete a level you will get 20 points")
                            .font(.body)
                    }
                }.onTapGesture {
                    viewModel.setSlide( .points)
                }.tag(Slide.games)
                ZStack {
                    Image("stars")
                    VStack(alignment: .leading) {
                        Text("POINTS").font(.title)
                        Text("You can use the points you collected")
                            .font(.body)
                    }
                }.onTapGesture {
                    viewModel.setSlide(.trophy)
                }.tag(Slide.points)
                ZStack {
                    Image("podium")
                    VStack(alignment: .leading) {
                        Text("TROPHY").font(.title)
                        Text("you can use the points you collected to unlock avatars and characters")
                            .font(.body)
                    }
                }.onTapGesture {
                    print(UserDefaults.standard.bool(forKey: "userOnboarded"))
                    mainvm.setPage(.home)
                }.tag(Slide.trophy)
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
