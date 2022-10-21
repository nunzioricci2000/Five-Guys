//
//  HomeView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 19/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var currentPage: Page
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome you on board, Lets roll now!")
            Spacer()
            Button() {
                currentPage = .games
            } label: {
                Text("Games")
            }
            Spacer()
            Button() {
                
            } label: {
                Text("Points")
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var currentPage: Page = .home
    
    static var previews: some View {
        HomeView(currentPage: $currentPage)
    }
}
