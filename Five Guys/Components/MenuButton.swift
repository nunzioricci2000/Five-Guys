//
//  MenuButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct MenuButton: View {
    @State var title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 35, design: .rounded))
            .foregroundColor(Color("main"))
            .fontWeight(.semibold)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("main"), lineWidth: 5)
                    .frame(width: 300, height: 100)
            )
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton("PLAY!")
    }
}
