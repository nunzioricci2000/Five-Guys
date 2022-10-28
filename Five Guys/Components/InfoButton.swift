//
//  InfoButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 28/10/22.
//

import SwiftUI

struct InfoButton: View {
    var body: some View {
        Image(systemName: "info.circle")
            .font(.system(size: 50, design: .rounded))
            .foregroundColor(Color("main"))
    }
}

struct InfoButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            
            InfoButton()
        }
    }
}
