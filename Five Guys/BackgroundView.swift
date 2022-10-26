//
//  OnboardBackgroundView.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 26/10/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [
            Color("1"), Color("2"), Color("3"), Color ("4"), Color("5"), Color ("6") ], startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
