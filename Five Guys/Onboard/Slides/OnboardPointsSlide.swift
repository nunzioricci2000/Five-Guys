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
                .position(x:270, y:150)
            
            VStack(alignment: .leading) {
                Text("POINTS")
                    .fontWeight(.bold)
                    .font(.system(size:50 , design: .rounded)).foregroundColor(.white)
                Text("You can use the points you collected to buy")
                    .fontWeight(.semibold)
                    .font(.system(size:20 , design: .rounded)).foregroundColor(.white)

                
            } .offset(y: 150)
        }
        
    }
    
    struct OnboardPointsSlide_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {
                BackgroundView()
                OnboardPointsSlide()
            }
        }
    }
}
