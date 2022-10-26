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
                .position(x: 350, y:250)
            VStack(alignment: .leading) {
                Text("TROPHY")
                    .fontWeight(.bold)
                    .font(.system(size:50 , design: .rounded)).foregroundColor(.white)
                Text("you can use the points you collected to unlock avatars and characters")
                    .fontWeight(.semibold)
                    .font(.system(size:20 , design: .rounded)).foregroundColor(.white)
            } .offset(y: 150)
        }
    }
}

struct OnboardTrophySlide_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            OnboardTrophySlide()
        }
    }
}
