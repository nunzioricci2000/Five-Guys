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
            OnboardBackgroundView()
            TabView(selection: $viewModel.slide) {
                OnboardGamesSlide().onTapGesture {
                        viewModel.setSlide( .points)
                    }
                    .tag(Slide.games)
                OnboardPointsSlide().onTapGesture {
                    viewModel.setSlide(.trophy)
                }.tag(Slide.points)
                OnboardTrophySlide().onTapGesture {
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
        OnboardView().environmentObject(MainView.ViewModel())
    }
}
