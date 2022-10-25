//
//  HomeView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 19/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var mainvm: MainView.ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                    Color.gray.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Welcome you on board, Lets roll now!")
                    Spacer()
                    NavigationLink(destination: GamesView(), label: {
                        Text("Games")
                    }).buttonStyle(.borderedProminent)
                    Spacer()
                    NavigationLink(destination: GamesView(), label: {
                        Text("Points")
                    }).buttonStyle(.borderedProminent)
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
