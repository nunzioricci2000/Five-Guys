//
//  BackIcon.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct BackIcon: View {
    var size: CGFloat
    var fontWeigth: Font.Weight
    var padding: CGFloat
    
    init(size: CGFloat = 40, fontWeigth: Font.Weight = .medium, padding: CGFloat = 20) {
        self.size = size
        self.fontWeigth = fontWeigth
        self.padding = padding
    }
    
    var body: some View {
        Image(systemName: "chevron.left")
            .font(.system(size: size))
            .fontWeight(fontWeigth)
            .padding(padding)
            .foregroundColor(Color("main"))
    }
}

struct BackIcon_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            BackIcon()
        }
    }
}
