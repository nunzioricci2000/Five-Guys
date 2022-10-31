//
//  MenuButtonText.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 31/10/22.
//

import SwiftUI

struct MenuButtonText: View {
    @State var title: String
    @State var subtitle: String
    
    init(_ title: String, subtitle: String = "") {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 35, design: .rounded))
                .foregroundColor(Color("main"))
                .fontWeight(.semibold)
            if subtitle != "" {
                Subtitle(subtitle)
            }
        }
    }
}

struct MenuButtonText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            MenuButtonText("Play", subtitle: "Ciao!")
        }
    }
}
