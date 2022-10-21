//
//  SwiftUIView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 20/10/22.
//

import SwiftUI

struct GamesView: View {
    @Binding var currentPage: Page
    
    var body: some View {
        VStack {
            Spacer()
            Text("GAMES").font(.title)
            Spacer()
            Button {
                currentPage = .level(1)
            } label: {
                Text("Level 1")
            }
            Spacer()
            Button {
                currentPage = .level(2)
            } label: {
                Text("Level 2")
            }
            Spacer()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    @State static var currentPage: Page = .games
    static var previews: some View {
        GamesView(currentPage: $currentPage)
    }
}
