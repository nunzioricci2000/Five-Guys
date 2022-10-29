//
//  Background.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 29/10/22.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(colors: [Color("BackgroundColorBottomTrailing"), Color("BackgroundColorTopLeading")], startPoint: .bottomTrailing, endPoint: .topLeading)
            .ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
