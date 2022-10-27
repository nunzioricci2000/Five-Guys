//
//  Subtitle.swift
//  Five Guys
//
//  Created by Nunzio Ricci on 27/10/22.
//

import SwiftUI

struct Subtitle: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 20, design: .rounded))
            .fontWeight(.bold)
    }
}

struct Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle("Level 1 / 10000000")
    }
}
