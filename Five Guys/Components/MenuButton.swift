//
//  MenuButton.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct MenuButton: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(Color("main"))
                .padding(10)
                .frame(width: 300, height: 100)
            Text(title)
                .font(.system(size: 35, design: .rounded))
                .foregroundColor(Color("background"))
                .fontWeight(.semibold)
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton("PLAY!")
    }
}
