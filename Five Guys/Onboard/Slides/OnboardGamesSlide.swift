//
//  OnboardGamesSlide.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct OnboardGamesSlide: View {
    var body: some View {
        ZStack {
            Image("maze")
            VStack(alignment: .leading) {
                Text("GAMES")
                    .font(.title)
                Text("In each level you will face a different game. Every time you complete a level you will get 20 points")
                    .font(.body)
            }
        }
    }
}

struct OnboardGamesSlide_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            OnboardBackgroundView()
            OnboardGamesSlide()
        }
    }
}
