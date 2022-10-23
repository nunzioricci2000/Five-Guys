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
                currentPage = .level(.fivetiles(5))
            } label: {
                Text("Five Tiles")
                    .padding()
            }.buttonStyle(.bordered)
            Spacer()
            Button {
                currentPage = .level(.tris(5))
            } label: {
                Text("Tris")
                    .padding()
            }.buttonStyle(.bordered)
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
