//
//  MenuButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct MenuButton: View {
    @State var title: String
    @State var subtitle: String
    
    init(_ title: String, subtitle: String = "") {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("main"), lineWidth: 5)
                .frame(width: 300, height: 100)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("main").opacity(0.0001))
                .frame(width: 300, height: 100)
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
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background()
            VStack {
                Spacer()
                MenuButton("PLAY!")
                Spacer()
                MenuButton("PLAY",subtitle: "Level: 13")
                Spacer()
            }
        }
    }
}
