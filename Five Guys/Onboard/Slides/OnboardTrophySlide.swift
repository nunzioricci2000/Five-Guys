//
//  OnboardTrophySlide.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct OnboardTrophySlide: View {
    var body: some View {
        ZStack {
            Image("podium")
            VStack(alignment: .leading) {
                Text("TROPHY").font(.title)
                Text("you can use the points you collected to unlock avatars and characters")
                    .font(.body)
            }
        }
    }
}

struct OnboardTrophySlide_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            OnboardBackgroundView()
            OnboardTrophySlide()
        }
    }
}
