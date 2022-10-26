//
//  OnboardPointsSlide.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct OnboardPointsSlide: View {
    var body: some View {
        ZStack {
            Image("stars")
            VStack(alignment: .leading) {
                Text("POINTS").font(.title)
                Text("You can use the points you collected")
                    .font(.body)
            }
        }
    }
}

struct OnboardPointsSlide_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            OnboardBackgroundView()
            OnboardPointsSlide()
        }
    }
}
