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
                .position(x: 80, y:60)
            VStack(alignment: .leading) {
                Text("GAMES")
                    .fontWeight(.bold)
                    .font(.system(size: 50, design: .rounded)).foregroundColor(.white)
                Text("In each level you will face a different game. Every time you complete a level you will get 20 points")
                    .fontWeight(.semibold)
                    .font(.system(size: 20, design: .rounded)).foregroundColor(.white)
            }
            .padding(15)
            .offset(y: 150)
            
            
        }
    }
}

struct OnboardGamesSlide_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            OnboardGamesSlide()
        }
    }
}
