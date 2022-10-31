//
//  SwiftUIView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import SwiftUI

struct Foreground: View {
    var body: some View {
        LinearGradient(colors: [Color("ForegroundColorTopLeading"), Color("ForegroundColorBottomTrailing")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct Foreground_Previews: PreviewProvider {
    static var previews: some View {
        Foreground()
    }
}
