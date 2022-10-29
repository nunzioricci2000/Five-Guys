//
//  Title.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct Title: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 50, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(Color("main"))
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea()
            Title("FIVE TILES")
        }
    }
}
